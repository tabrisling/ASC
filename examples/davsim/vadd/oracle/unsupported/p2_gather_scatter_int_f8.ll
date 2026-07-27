; Direct LLVM IR probe for fail-closed P2 integer/f8 gather/scatter coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %gi32 = call <64 x i32> @llvm.hivm.vgather.v64i32(ptr addrspace(6) null, <64 x i32> undef, <256 x i1> %mask32)
  %gi16 = call <128 x i16> @llvm.hivm.vgather.v128i16(ptr addrspace(6) null, <128 x i32> undef, <256 x i1> %mask16)
  %gi8 = call <256 x i8> @llvm.hivm.vgather.v256i8(ptr addrspace(6) null, <256 x i32> undef, <256 x i1> %mask8)
  %gf8e4 = call <256 x i8> @llvm.hivm.vgather.v256f8e4m3fn(ptr addrspace(6) null, <256 x i32> undef, <256 x i1> %mask8)
  %gf8e5 = call <256 x i8> @llvm.hivm.vgather.v256f8e5m2(ptr addrspace(6) null, <256 x i32> undef, <256 x i1> %mask8)

  call void @llvm.hivm.vscatter.v64i32(<64 x i32> %gi32, ptr addrspace(6) null, <64 x i32> undef, <256 x i1> %mask32)
  call void @llvm.hivm.vscatter.v128i16(<128 x i16> %gi16, ptr addrspace(6) null, <128 x i32> undef, <256 x i1> %mask16)
  call void @llvm.hivm.vscatter.v256i8(<256 x i8> %gi8, ptr addrspace(6) null, <256 x i32> undef, <256 x i1> %mask8)
  call void @llvm.hivm.vscatter.v256f8e4m3fn(<256 x i8> %gf8e4, ptr addrspace(6) null, <256 x i32> undef, <256 x i1> %mask8)
  call void @llvm.hivm.vscatter.v256f8e5m2(<256 x i8> %gf8e5, ptr addrspace(6) null, <256 x i32> undef, <256 x i1> %mask8)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <64 x i32> @llvm.hivm.vgather.v64i32(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vgather.v128i16(ptr addrspace(6), <128 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vgather.v256i8(ptr addrspace(6), <256 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vgather.v256f8e4m3fn(ptr addrspace(6), <256 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vgather.v256f8e5m2(ptr addrspace(6), <256 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v64i32(<64 x i32>, ptr addrspace(6), <64 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v128i16(<128 x i16>, ptr addrspace(6), <128 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v256i8(<256 x i8>, ptr addrspace(6), <256 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v256f8e4m3fn(<256 x i8>, ptr addrspace(6), <256 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v256f8e5m2(<256 x i8>, ptr addrspace(6), <256 x i32>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
