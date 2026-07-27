; Minimal dav f16 fused-vector LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_fused_f16: GM inputs are copied
; to UB, loaded into f16 registers, passed through vlrelu/vmadd/vaxpy, stored
; back through UB, and copied to GM.

define dso_local ptc_kernel void @dav_fused_f16(ptr addrspace(1) %x,
                                                ptr addrspace(1) %acc,
                                                ptr addrspace(1) %mul,
                                                ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) null, ptr addrspace(1) %x, i64 8589935616, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %acc, i64 8589935616, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), ptr addrspace(1) %mul, i64 8589935616, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %mask = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %vx = call <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %vacc = call <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %vmul = call <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %relu = call <128 x half> @llvm.hivm.vlrelu.x.v128f16(<128 x half> %vx, half 0xH3000, <256 x i1> %mask)
  %madd = call <128 x half> @llvm.hivm.vmadd.m.v128f16(<128 x half> %vacc, <128 x half> %relu, <128 x half> %vmul, <256 x i1> %mask)
  %result = call <128 x half> @llvm.hivm.vaxpy.m.v128f16(<128 x half> %madd, <128 x half> %vx, half 0xHB800, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v128f16(<128 x half> %result, ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), i64 8589935616, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6), i32, i32, i32)
declare <128 x half> @llvm.hivm.vlrelu.x.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x half> @llvm.hivm.vmadd.m.v128f16(<128 x half>, <128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vaxpy.m.v128f16(<128 x half>, <128 x half>, half, <256 x i1>)
declare void @llvm.hivm.vstsx1.v128f16(<128 x half>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @dav_fused_f16, !"kernel", i32 1}
