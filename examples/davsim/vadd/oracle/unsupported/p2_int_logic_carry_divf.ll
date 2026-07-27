; Direct LLVM IR probe for fail-closed P2 integer logic/carry/divf coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %vand_m_v256i8 = call <256 x i8> @llvm.hivm.vand.m.v256i8(<256 x i8> undef, <256 x i8> undef, <256 x i1> %mask8)
  %vand_m_v128i16 = call <128 x i16> @llvm.hivm.vand.m.v128i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask16)
  %vand_m_v64i32 = call <64 x i32> @llvm.hivm.vand.m.v64i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)
  %vand_x_v256i8 = call <256 x i8> @llvm.hivm.vand.x.v256i8(<256 x i8> undef, <256 x i8> undef, <256 x i1> %mask8)
  %vand_x_v128i16 = call <128 x i16> @llvm.hivm.vand.x.v128i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask16)
  %vand_x_v64i32 = call <64 x i32> @llvm.hivm.vand.x.v64i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)
  %vand_z_v256i8 = call <256 x i8> @llvm.hivm.vand.z.v256i8(<256 x i8> undef, <256 x i8> undef, <256 x i1> %mask8)
  %vand_z_v128i16 = call <128 x i16> @llvm.hivm.vand.z.v128i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask16)
  %vand_z_v64i32 = call <64 x i32> @llvm.hivm.vand.z.v64i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)
  %vdivf_m = call <128 x i16> @llvm.hivm.vdivf.v128u16.m(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask16)
  %vdivf_x = call <128 x i16> @llvm.hivm.vdivf.v128u16.x(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask16)
  %vaddc_s32 = call { <64 x i32>, <256 x i1> } @llvm.hivm.vaddc.v64s32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)
  %vsubc_s32 = call { <64 x i32>, <256 x i1> } @llvm.hivm.vsubc.v64s32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32)
  %vaddcs_s32 = call { <64 x i32>, <256 x i1> } @llvm.hivm.vaddcs.v64s32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32, <256 x i1> %mask32)
  %vsubcs_s32 = call { <64 x i32>, <256 x i1> } @llvm.hivm.vsubcs.v64s32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask32, <256 x i1> %mask32)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <256 x i8> @llvm.hivm.vand.m.v256i8(<256 x i8>, <256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vand.m.v128i16(<128 x i16>, <128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vand.m.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vand.x.v256i8(<256 x i8>, <256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vand.x.v128i16(<128 x i16>, <128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vand.x.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vand.z.v256i8(<256 x i8>, <256 x i8>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vand.z.v128i16(<128 x i16>, <128 x i16>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vand.z.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vdivf.v128u16.m(<128 x i16>, <128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vdivf.v128u16.x(<128 x i16>, <128 x i16>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vaddc.v64s32(<64 x i32>, <64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vsubc.v64s32(<64 x i32>, <64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vaddcs.v64s32(<64 x i32>, <64 x i32>, <256 x i1>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vsubcs.v64s32(<64 x i32>, <64 x i32>, <256 x i1>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
