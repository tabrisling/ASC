; Direct LLVM IR probe for fail-closed P2 predicate utility coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)

  %movvp = call <256 x i1> @llvm.hivm.movvp(<64 x i32> undef, i32 0)
  %pmov = call <256 x i1> @llvm.hivm.pmov(<256 x i1> %mask)

  %pc0 = call <256 x i1> @llvm.hivm.pcast.b8.to.b16(<256 x i1> %mask)
  %pc1 = call <256 x i1> @llvm.hivm.pcast.b8.to.b32(<256 x i1> %pc0)
  %pc2 = call <256 x i1> @llvm.hivm.pcast.b16.to.b8(<256 x i1> %pc1)
  %pc3 = call <256 x i1> @llvm.hivm.pcast.b16.to.b32(<256 x i1> %pc2)
  %pc4 = call <256 x i1> @llvm.hivm.pcast.b32.to.b8(<256 x i1> %pc3)
  %pc5 = call <256 x i1> @llvm.hivm.pcast.b32.to.b16(<256 x i1> %pc4)

  %ppack = call <256 x i1> @llvm.hivm.ppack.z(<256 x i1> %pc5, i32 0)
  %punpack = call <256 x i1> @llvm.hivm.punpack(<256 x i1> %ppack, i32 0)

  %pi0 = call { <256 x i1>, <256 x i1> } @llvm.hivm.pintlv.b32(<256 x i1> %punpack, <256 x i1> %pmov)
  %pi1 = call { <256 x i1>, <256 x i1> } @llvm.hivm.pintlv.b16(<256 x i1> %punpack, <256 x i1> %movvp)
  %pi2 = call { <256 x i1>, <256 x i1> } @llvm.hivm.pintlv.b8(<256 x i1> %punpack, <256 x i1> %mask)

  %pd0 = call { <256 x i1>, <256 x i1> } @llvm.hivm.pdintlv.b32(<256 x i1> %punpack, <256 x i1> %pmov)
  %pd1 = call { <256 x i1>, <256 x i1> } @llvm.hivm.pdintlv.b16(<256 x i1> %punpack, <256 x i1> %movvp)
  %pd2 = call { <256 x i1>, <256 x i1> } @llvm.hivm.pdintlv.b8(<256 x i1> %punpack, <256 x i1> %mask)

  %vselr = call <64 x i32> @llvm.hivm.vselr(<64 x i32> undef, <64 x i32> undef)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.movvp(<64 x i32>, i32)
declare <256 x i1> @llvm.hivm.pmov(<256 x i1>)
declare <256 x i1> @llvm.hivm.pcast.b8.to.b16(<256 x i1>)
declare <256 x i1> @llvm.hivm.pcast.b8.to.b32(<256 x i1>)
declare <256 x i1> @llvm.hivm.pcast.b16.to.b8(<256 x i1>)
declare <256 x i1> @llvm.hivm.pcast.b16.to.b32(<256 x i1>)
declare <256 x i1> @llvm.hivm.pcast.b32.to.b8(<256 x i1>)
declare <256 x i1> @llvm.hivm.pcast.b32.to.b16(<256 x i1>)
declare <256 x i1> @llvm.hivm.ppack.z(<256 x i1>, i32)
declare <256 x i1> @llvm.hivm.punpack(<256 x i1>, i32)
declare { <256 x i1>, <256 x i1> } @llvm.hivm.pintlv.b32(<256 x i1>, <256 x i1>)
declare { <256 x i1>, <256 x i1> } @llvm.hivm.pintlv.b16(<256 x i1>, <256 x i1>)
declare { <256 x i1>, <256 x i1> } @llvm.hivm.pintlv.b8(<256 x i1>, <256 x i1>)
declare { <256 x i1>, <256 x i1> } @llvm.hivm.pdintlv.b32(<256 x i1>, <256 x i1>)
declare { <256 x i1>, <256 x i1> } @llvm.hivm.pdintlv.b16(<256 x i1>, <256 x i1>)
declare { <256 x i1>, <256 x i1> } @llvm.hivm.pdintlv.b8(<256 x i1>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vselr(<64 x i32>, <64 x i32>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
