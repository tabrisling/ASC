; Minimal dav f16 vadd LLVM IR smoke test for tools/asc-sim.
;
; GM inputs are copied to UB, loaded into f16 registers, added, stored back
; through UB, and copied to GM.

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %ctrl0 = call i64 @llvm.hivm.GET.CTRL()
  %ctrl1 = call i64 @llvm.hivm.SBITSET0(i64 %ctrl0, i64 6)
  %ctrl2 = call i64 @llvm.hivm.SBITSET0(i64 %ctrl1, i64 7)
  %ctrl3 = call i64 @llvm.hivm.SBITSET0(i64 %ctrl2, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %ctrl3)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) null, ptr addrspace(1) %0, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f16.DV(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(1) %1, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 1)
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %a = call <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %b = call <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %sum = call <128 x half> @llvm.hivm.vadd.s.x.v128f16(<128 x half> %a, <128 x half> %b, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v128f16(<128 x half> %sum, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %2, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6), i32, i32, i32)
declare <128 x half> @llvm.hivm.vadd.s.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v128f16(<128 x half>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare i64 @llvm.hivm.GET.CTRL()
declare i64 @llvm.hivm.SBITSET0(i64, i64)
declare void @llvm.hivm.SET.CTRL(i64)
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
!1 = !{ptr @add_kernel, !"kernel", i32 1}
