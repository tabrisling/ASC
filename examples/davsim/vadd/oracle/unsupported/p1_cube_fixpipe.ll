; Direct LLVM IR probe for fail-closed P1 cube fixpipe coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  call void @llvm.hivm.FIX.L0C.TO.L1.f32.EXT(ptr addrspace(2) null, ptr addrspace(5) null, i64 0, i64 0)
  call void @llvm.hivm.FIX.L0C.TO.L1.f322f16.EXT(ptr addrspace(2) null, ptr addrspace(5) null, i64 0, i64 0)
  call void @llvm.hivm.FIX.L0C.TO.OUT.f322f16.EXT(ptr addrspace(1) %2, ptr addrspace(5) null, i64 0, i64 0)
  call void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6) null, ptr addrspace(5) null, i64 0, i64 0)
  call void @llvm.hivm.FIX.L0C.TO.UB.f322f16.EXT(ptr addrspace(6) null, ptr addrspace(5) null, i64 0, i64 0)
  ret void
}

declare void @llvm.hivm.FIX.L0C.TO.L1.f32.EXT(ptr addrspace(2), ptr addrspace(5), i64, i64)
declare void @llvm.hivm.FIX.L0C.TO.L1.f322f16.EXT(ptr addrspace(2), ptr addrspace(5), i64, i64)
declare void @llvm.hivm.FIX.L0C.TO.OUT.f322f16.EXT(ptr addrspace(1), ptr addrspace(5), i64, i64)
declare void @llvm.hivm.FIX.L0C.TO.UB.f32.EXT(ptr addrspace(6), ptr addrspace(5), i64, i64)
declare void @llvm.hivm.FIX.L0C.TO.UB.f322f16.EXT(ptr addrspace(6), ptr addrspace(5), i64, i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
