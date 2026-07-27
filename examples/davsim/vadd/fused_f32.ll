; Minimal dav f32 fused-vector LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_fused_f32: GM inputs are copied
; to UB, loaded into registers, passed through vlrelu/vmadd/vaxpy, stored back
; through UB, and copied to GM.

define dso_local ptc_kernel void @dav_fused_f32(ptr addrspace(1) %x,
                                                ptr addrspace(1) %acc,
                                                ptr addrspace(1) %mul,
                                                ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) null, ptr addrspace(1) %x, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(1) %acc, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %mul, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %vx = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %vacc = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %vmul = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %relu = call <64 x float> @llvm.hivm.vlrelu.x.v64f32(<64 x float> %vx, float 1.250000e-01, <256 x i1> %mask)
  %madd = call <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float> %vacc, <64 x float> %relu, <64 x float> %vmul, <256 x i1> %mask)
  %result = call <64 x float> @llvm.hivm.vaxpy.m.v64f32(<64 x float> %madd, <64 x float> %vx, float -5.000000e-01, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %result, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6), i32, i32, i32)
declare <64 x float> @llvm.hivm.vlrelu.x.v64f32(<64 x float>, float, <256 x i1>)
declare <64 x float> @llvm.hivm.vmadd.m.v64f32(<64 x float>, <64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vaxpy.m.v64f32(<64 x float>, <64 x float>, float, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @dav_fused_f32, !"kernel", i32 1}
