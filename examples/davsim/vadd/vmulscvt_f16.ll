; Minimal dav f32-to-f16 vmulscvt LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_vmulscvt_f16: GM f32 input is
; copied to UB, converted into even f16 lanes, stored to UB, and copied to GM.

define dso_local ptc_kernel void @dav_vmulscvt_f16(ptr addrspace(1) %input,
                                                   ptr addrspace(1) %output) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) null, ptr addrspace(1) %input, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %src_mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %store_mask = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %src = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %converted = call <128 x half> @llvm.hivm.vmulscvt.v128f16(<64 x float> %src, float 5.000000e-01, <256 x i1> %src_mask, i32 0)
  call void @llvm.hivm.vstsx1.v128f16(<128 x half> %converted, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %store_mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6), i32, i32, i32)
declare <128 x half> @llvm.hivm.vmulscvt.v128f16(<64 x float>, float, <256 x i1>, i32)
declare void @llvm.hivm.vstsx1.v128f16(<128 x half>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
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
!1 = !{ptr @dav_vmulscvt_f16, !"kernel", i32 1}
