; Direct LLVM IR probe for fail-closed f16 reduction coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %result = call <128 x half> @llvm.hivm.vcmin.s.m.v128f16(<128 x half> undef, <256 x i1> %mask)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <128 x half> @llvm.hivm.vcmin.s.m.v128f16(<128 x half>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
