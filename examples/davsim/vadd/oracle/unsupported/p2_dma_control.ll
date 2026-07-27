; Direct LLVM IR probe for fail-closed P2 DMA/control intrinsic coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  call void @llvm.hivm.GET.BUF.mode(i64 0, i64 0, i64 0)
  call void @llvm.hivm.RLS.BUF.mode(i64 0, i64 0, i64 0)

  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s16.DV(ptr addrspace(6) null, ptr addrspace(1) %0, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2) null, ptr addrspace(6) null, i64 12884968448)

  call void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.F32.V310(ptr addrspace(2) null, ptr addrspace(1) %0, i64 18014398509486080, i64 128)
  call void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.F16.V310(ptr addrspace(2) inttoptr (i64 8192 to ptr addrspace(2)), ptr addrspace(1) %1, i64 18014398509486080, i64 128)
  call void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.U16.V310(ptr addrspace(2) inttoptr (i64 16384 to ptr addrspace(2)), ptr addrspace(1) %2, i64 18014398509486080, i64 128)
  call void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.U8.V310(ptr addrspace(2) inttoptr (i64 24576 to ptr addrspace(2)), ptr addrspace(1) %0, i64 18014398509486080, i64 128)
  ret void
}

declare void @llvm.hivm.GET.BUF.mode(i64, i64, i64)
declare void @llvm.hivm.RLS.BUF.mode(i64, i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s16.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.UB.TO.L1.v310(ptr addrspace(2), ptr addrspace(6), i64)
declare void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.F32.V310(ptr addrspace(2), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.F16.V310(ptr addrspace(2), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.U16.V310(ptr addrspace(2), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.L1.MULTI.ND2NZ.U8.V310(ptr addrspace(2), ptr addrspace(1), i64, i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
