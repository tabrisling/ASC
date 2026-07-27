; Direct LLVM IR probe for fail-closed P2 predicate vsel coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %sel0 = call <128 x i16> @llvm.hivm.vsel.v128i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask16)
  %sel1 = call <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8> undef, <256 x i8> undef, <256 x i1> %mask8)
  %sel2 = call <256 x i8> @llvm.hivm.vsel.v256f8e4m3fn(<256 x i8> undef, <256 x i8> undef, <256 x i1> %mask8)
  %sel3 = call <256 x i8> @llvm.hivm.vsel.v256f8e5m2(<256 x i8> undef, <256 x i8> undef, <256 x i1> %mask8)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <128 x i16> @llvm.hivm.vsel.v128i16(<128 x i16>, <128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vsel.v256i8(<256 x i8>, <256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vsel.v256f8e4m3fn(<256 x i8>, <256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vsel.v256f8e5m2(<256 x i8>, <256 x i8>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
