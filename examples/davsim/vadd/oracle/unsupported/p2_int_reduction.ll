; Direct LLVM IR probe for fail-closed P2 integer reduction coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %vcadd_s_i8 = call <256 x i8> @llvm.hivm.vcadd.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcadd_u_i8 = call <256 x i8> @llvm.hivm.vcadd.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcadd_s_i16 = call <128 x i16> @llvm.hivm.vcadd.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcadd_u_i16 = call <128 x i16> @llvm.hivm.vcadd.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcadd_s_i32 = call <64 x i32> @llvm.hivm.vcadd.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcadd_u_i32 = call <64 x i32> @llvm.hivm.vcadd.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)

  %vcmax_s_x_i8 = call <256 x i8> @llvm.hivm.vcmax.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmax_u_x_i8 = call <256 x i8> @llvm.hivm.vcmax.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmax_s_x_i16 = call <128 x i16> @llvm.hivm.vcmax.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmax_u_x_i16 = call <128 x i16> @llvm.hivm.vcmax.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmax_s_x_i32 = call <64 x i32> @llvm.hivm.vcmax.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcmax_u_x_i32 = call <64 x i32> @llvm.hivm.vcmax.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcmax_s_m_i8 = call <256 x i8> @llvm.hivm.vcmax.s.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmax_u_m_i8 = call <256 x i8> @llvm.hivm.vcmax.u.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmax_s_m_i16 = call <128 x i16> @llvm.hivm.vcmax.s.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmax_u_m_i16 = call <128 x i16> @llvm.hivm.vcmax.u.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmax_s_m_i32 = call <64 x i32> @llvm.hivm.vcmax.s.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcmax_u_m_i32 = call <64 x i32> @llvm.hivm.vcmax.u.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)

  %vcmin_s_x_i8 = call <256 x i8> @llvm.hivm.vcmin.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmin_u_x_i8 = call <256 x i8> @llvm.hivm.vcmin.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmin_s_x_i16 = call <128 x i16> @llvm.hivm.vcmin.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmin_u_x_i16 = call <128 x i16> @llvm.hivm.vcmin.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmin_s_x_i32 = call <64 x i32> @llvm.hivm.vcmin.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcmin_u_x_i32 = call <64 x i32> @llvm.hivm.vcmin.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcmin_s_m_i8 = call <256 x i8> @llvm.hivm.vcmin.s.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmin_u_m_i8 = call <256 x i8> @llvm.hivm.vcmin.u.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcmin_s_m_i16 = call <128 x i16> @llvm.hivm.vcmin.s.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmin_u_m_i16 = call <128 x i16> @llvm.hivm.vcmin.u.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcmin_s_m_i32 = call <64 x i32> @llvm.hivm.vcmin.s.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcmin_u_m_i32 = call <64 x i32> @llvm.hivm.vcmin.u.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <256 x i8> @llvm.hivm.vcadd.s.x.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcadd.u.x.v256i8(<256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcadd.s.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcadd.u.x.v128i16(<128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcadd.s.x.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcadd.u.x.v64i32(<64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmax.s.x.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmax.u.x.v256i8(<256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmax.s.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmax.u.x.v128i16(<128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmax.s.x.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmax.u.x.v64i32(<64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmax.s.m.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmax.u.m.v256i8(<256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmax.s.m.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmax.u.m.v128i16(<128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmax.s.m.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmax.u.m.v64i32(<64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmin.s.x.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmin.u.x.v256i8(<256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmin.s.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmin.u.x.v128i16(<128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmin.s.x.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmin.u.x.v64i32(<64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmin.s.m.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcmin.u.m.v256i8(<256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmin.s.m.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcmin.u.m.v128i16(<128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmin.s.m.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcmin.u.m.v64i32(<64 x i32>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
