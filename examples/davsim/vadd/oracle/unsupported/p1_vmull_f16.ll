; Direct LLVM IR probe for fail-closed P1 f16 vmull coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %m = call { <128 x half>, <128 x half> } @llvm.hivm.vmull.s.m.v128f16(<256 x half> undef, <256 x half> undef, <256 x i1> %mask, <128 x half> undef)
  %x = call { <128 x half>, <128 x half> } @llvm.hivm.vmull.s.x.v128f16(<256 x half> undef, <256 x half> undef, <256 x i1> %mask, <128 x half> undef)
  %z = call { <128 x half>, <128 x half> } @llvm.hivm.vmull.s.z.v128f16(<256 x half> undef, <256 x half> undef, <256 x i1> %mask, <128 x half> undef)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare { <128 x half>, <128 x half> } @llvm.hivm.vmull.s.m.v128f16(<256 x half>, <256 x half>, <256 x i1>, <128 x half>)
declare { <128 x half>, <128 x half> } @llvm.hivm.vmull.s.x.v128f16(<256 x half>, <256 x half>, <256 x i1>, <128 x half>)
declare { <128 x half>, <128 x half> } @llvm.hivm.vmull.s.z.v128f16(<256 x half>, <256 x half>, <256 x i1>, <128 x half>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
