; Direct LLVM IR probe for fail-closed P2 integer scalar-vector coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %vadds_s_m_v256i8 = call <256 x i8> @llvm.hivm.vadds.s.m.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vadds_s_m_v128i16 = call <128 x i16> @llvm.hivm.vadds.s.m.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vadds_s_m_v64i32 = call <64 x i32> @llvm.hivm.vadds.s.m.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vadds_s_x_v256i8 = call <256 x i8> @llvm.hivm.vadds.s.x.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vadds_s_x_v128i16 = call <128 x i16> @llvm.hivm.vadds.s.x.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vadds_s_x_v64i32 = call <64 x i32> @llvm.hivm.vadds.s.x.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vadds_u_m_v256i8 = call <256 x i8> @llvm.hivm.vadds.u.m.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vadds_u_m_v128i16 = call <128 x i16> @llvm.hivm.vadds.u.m.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vadds_u_m_v64i32 = call <64 x i32> @llvm.hivm.vadds.u.m.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vadds_u_x_v256i8 = call <256 x i8> @llvm.hivm.vadds.u.x.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vadds_u_x_v128i16 = call <128 x i16> @llvm.hivm.vadds.u.x.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vadds_u_x_v64i32 = call <64 x i32> @llvm.hivm.vadds.u.x.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vmuls_s_m_v256i8 = call <256 x i8> @llvm.hivm.vmuls.s.m.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vmuls_s_m_v128i16 = call <128 x i16> @llvm.hivm.vmuls.s.m.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vmuls_s_m_v64i32 = call <64 x i32> @llvm.hivm.vmuls.s.m.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vmuls_s_x_v256i8 = call <256 x i8> @llvm.hivm.vmuls.s.x.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vmuls_s_x_v128i16 = call <128 x i16> @llvm.hivm.vmuls.s.x.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vmuls_s_x_v64i32 = call <64 x i32> @llvm.hivm.vmuls.s.x.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vmuls_u_m_v256i8 = call <256 x i8> @llvm.hivm.vmuls.u.m.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vmuls_u_m_v128i16 = call <128 x i16> @llvm.hivm.vmuls.u.m.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vmuls_u_m_v64i32 = call <64 x i32> @llvm.hivm.vmuls.u.m.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  %vmuls_u_x_v256i8 = call <256 x i8> @llvm.hivm.vmuls.u.x.v256i8(<256 x i8> undef, i8 0, <256 x i1> %mask8)
  %vmuls_u_x_v128i16 = call <128 x i16> @llvm.hivm.vmuls.u.x.v128i16(<128 x i16> undef, i16 0, <256 x i1> %mask16)
  %vmuls_u_x_v64i32 = call <64 x i32> @llvm.hivm.vmuls.u.x.v64i32(<64 x i32> undef, i32 0, <256 x i1> %mask32)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <256 x i8> @llvm.hivm.vadds.s.m.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vadds.s.m.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vadds.s.m.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vadds.s.x.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vadds.s.x.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vadds.s.x.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vadds.u.m.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vadds.u.m.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vadds.u.m.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vadds.u.x.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vadds.u.x.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vadds.u.x.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vmuls.s.m.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vmuls.s.m.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vmuls.s.m.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vmuls.s.x.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vmuls.s.x.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vmuls.s.x.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vmuls.u.m.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vmuls.u.m.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vmuls.u.m.v64i32(<64 x i32>, i32, <256 x i1>)
declare <256 x i8> @llvm.hivm.vmuls.u.x.v256i8(<256 x i8>, i8, <256 x i1>)
declare <128 x i16> @llvm.hivm.vmuls.u.x.v128i16(<128 x i16>, i16, <256 x i1>)
declare <64 x i32> @llvm.hivm.vmuls.u.x.v64i32(<64 x i32>, i32, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
