; Direct LLVM IR probe for fail-closed P2 integer grouped reduction coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)

  %vcgadd_s32 = call <64 x i32> @llvm.hivm.vcgadd.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcgadd_u32 = call <64 x i32> @llvm.hivm.vcgadd.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcgadd_s16 = call <128 x i16> @llvm.hivm.vcgadd.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcgadd_u16 = call <128 x i16> @llvm.hivm.vcgadd.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcgadd_s8 = call <256 x i8> @llvm.hivm.vcgadd.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcgadd_u8 = call <256 x i8> @llvm.hivm.vcgadd.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)

  %vcgmax_s32 = call <64 x i32> @llvm.hivm.vcgmax.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcgmax_u32 = call <64 x i32> @llvm.hivm.vcgmax.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcgmax_s16 = call <128 x i16> @llvm.hivm.vcgmax.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcgmax_u16 = call <128 x i16> @llvm.hivm.vcgmax.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcgmax_s8 = call <256 x i8> @llvm.hivm.vcgmax.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcgmax_u8 = call <256 x i8> @llvm.hivm.vcgmax.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)

  %vcgmin_s32 = call <64 x i32> @llvm.hivm.vcgmin.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcgmin_u32 = call <64 x i32> @llvm.hivm.vcgmin.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcgmin_s16 = call <128 x i16> @llvm.hivm.vcgmin.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcgmin_u16 = call <128 x i16> @llvm.hivm.vcgmin.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcgmin_s8 = call <256 x i8> @llvm.hivm.vcgmin.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcgmin_u8 = call <256 x i8> @llvm.hivm.vcgmin.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)

  %vcpadd_i32 = call <64 x i32> @llvm.hivm.vcpadd.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcpadd_i16 = call <128 x i16> @llvm.hivm.vcpadd.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)

  %vcbmax_s32_x = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmax_u32_x = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmax_s16_x = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmax_u16_x = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmax_s8_x = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcbmax_u8_x = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcbmax_s32_m = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmax_u32_m = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.u.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmax_s16_m = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmax_u16_m = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.u.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmax_s8_m = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcbmax_u8_m = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.u.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)

  %vcbmin_s32_x = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmin_u32_x = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.u.x.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmin_s16_x = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmin_u16_x = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.u.x.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmin_s8_x = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcbmin_u8_x = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.u.x.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcbmin_s32_m = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmin_u32_m = call { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.u.m.v64i32(<64 x i32> undef, <256 x i1> %mask32)
  %vcbmin_s16_m = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmin_u16_m = call { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.u.m.v128i16(<128 x i16> undef, <256 x i1> %mask16)
  %vcbmin_s8_m = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)
  %vcbmin_u8_m = call { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.u.m.v256i8(<256 x i8> undef, <256 x i1> %mask8)

  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <64 x i32> @llvm.hivm.vcgadd.s.x.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcgadd.u.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcgadd.s.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcgadd.u.x.v128i16(<128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcgadd.s.x.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcgadd.u.x.v256i8(<256 x i8>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcgmax.s.x.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcgmax.u.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcgmax.s.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcgmax.u.x.v128i16(<128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcgmax.s.x.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcgmax.u.x.v256i8(<256 x i8>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcgmin.s.x.v64i32(<64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcgmin.u.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcgmin.s.x.v128i16(<128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcgmin.u.x.v128i16(<128 x i16>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcgmin.s.x.v256i8(<256 x i8>, <256 x i1>)
declare <256 x i8> @llvm.hivm.vcgmin.u.x.v256i8(<256 x i8>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vcpadd.x.v64i32(<64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vcpadd.x.v128i16(<128 x i16>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v64i32(<64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.u.x.v64i32(<64 x i32>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v128i16(<128 x i16>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.u.x.v128i16(<128 x i16>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v256i8(<256 x i8>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.u.x.v256i8(<256 x i8>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v64i32(<64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmax.u.m.v64i32(<64 x i32>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v128i16(<128 x i16>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmax.u.m.v128i16(<128 x i16>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v256i8(<256 x i8>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmax.u.m.v256i8(<256 x i8>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v64i32(<64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.u.x.v64i32(<64 x i32>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v128i16(<128 x i16>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.u.x.v128i16(<128 x i16>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v256i8(<256 x i8>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.u.x.v256i8(<256 x i8>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v64i32(<64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vcbmin.u.m.v64i32(<64 x i32>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v128i16(<128 x i16>, <256 x i1>)
declare { <128 x i16>, <256 x i1> } @llvm.hivm.vcbmin.u.m.v128i16(<128 x i16>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v256i8(<256 x i8>, <256 x i1>)
declare { <256 x i8>, <256 x i1> } @llvm.hivm.vcbmin.u.m.v256i8(<256 x i8>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
