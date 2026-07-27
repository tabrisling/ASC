; Direct LLVM IR probe for fail-closed P2 vector conversion coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)

  %trc_f32 = call <64 x float> @llvm.hivm.vtrc.f32.x(<64 x float> undef, i32 0, <256 x i1> %mask)
  %trc_f16 = call <128 x half> @llvm.hivm.vtrc.f16.x(<128 x half> undef, i32 0, <256 x i1> %mask)
  %trc_bf16 = call <128 x bfloat> @llvm.hivm.vtrc.bf16.x(<128 x bfloat> undef, i32 0, <256 x i1> %mask)

  %if_u82f16 = call <128 x half> @llvm.hivm.vcvtif.u82f16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %if_s82f16 = call <128 x half> @llvm.hivm.vcvtif.s82f16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %if_s162f32 = call <64 x float> @llvm.hivm.vcvtif.s162f32.x(<128 x i16> undef, <256 x i1> %mask, i32 0)
  %if_s162f16 = call <128 x half> @llvm.hivm.vcvtif.s162f16.x(<128 x i16> undef, <256 x i1> %mask, i32 0)
  %if_s322f32 = call <64 x float> @llvm.hivm.vcvtif.s322f32.x(<64 x i32> undef, <256 x i1> %mask, i32 0)
  %if_s4x22f16 = call <128 x half> @llvm.hivm.vcvtif.s4x22f16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %if_s4x22bf16 = call <128 x bfloat> @llvm.hivm.vcvtif.s4x22bf16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %if_s642f32 = call <64 x float> @llvm.hivm.vcvtif.s642f32.x(<32 x i64> undef, <256 x i1> %mask, i32 0, i32 0)

  %fi_f322s32 = call <64 x i32> @llvm.hivm.vcvtfi.f322s32.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0)
  %fi_f162s16 = call <128 x i16> @llvm.hivm.vcvtfi.f162s16.x(<128 x half> undef, <256 x i1> %mask, i32 0, i32 0)
  %fi_f162s32 = call <64 x i32> @llvm.hivm.vcvtfi.f162s32.x(<128 x half> undef, <256 x i1> %mask, i32 0, i32 0)
  %fi_f162u8 = call <256 x i8> @llvm.hivm.vcvtfi.f162u8.x(<128 x half> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %fi_f162s8 = call <256 x i8> @llvm.hivm.vcvtfi.f162s8.x(<128 x half> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %fi_f322s16 = call <128 x i16> @llvm.hivm.vcvtfi.f322s16.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %fi_f322s64 = call <32 x i64> @llvm.hivm.vcvtfi.f322s64.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %fi_bf162s32 = call <64 x i32> @llvm.hivm.vcvtfi.bf162s32.x(<128 x bfloat> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %fi_f162s4x2 = call <256 x i8> @llvm.hivm.vcvtfi.f162s4x2.x(<128 x half> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)

  %ii_u162u8 = call <256 x i8> @llvm.hivm.vcvtii.u162u8.x(<128 x i16> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_s162u8 = call <256 x i8> @llvm.hivm.vcvtii.s162u8.x(<128 x i16> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_s322s16 = call <128 x i16> @llvm.hivm.vcvtii.s322s16.x(<64 x i32> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_s322u16 = call <128 x i16> @llvm.hivm.vcvtii.s322u16.x(<64 x i32> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_u322u16 = call <128 x i16> @llvm.hivm.vcvtii.u322u16.x(<64 x i32> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_u322s16 = call <128 x i16> @llvm.hivm.vcvtii.u322s16.x(<64 x i32> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_s642s32 = call <64 x i32> @llvm.hivm.vcvtii.s642s32.x(<32 x i64> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_u82u16 = call <128 x i16> @llvm.hivm.vcvtii.u82u16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %ii_s82s16 = call <128 x i16> @llvm.hivm.vcvtii.s82s16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %ii_s162s32 = call <64 x i32> @llvm.hivm.vcvtii.s162s32.x(<128 x i16> undef, <256 x i1> %mask, i32 0)
  %ii_s162u32 = call <64 x i32> @llvm.hivm.vcvtii.s162u32.x(<128 x i16> undef, <256 x i1> %mask, i32 0)
  %ii_u162u32 = call <64 x i32> @llvm.hivm.vcvtii.u162u32.x(<128 x i16> undef, <256 x i1> %mask, i32 0)
  %ii_s322s64 = call <32 x i64> @llvm.hivm.vcvtii.s322s64.x(<64 x i32> undef, <256 x i1> %mask, i32 0)
  %ii_u82u32 = call <64 x i32> @llvm.hivm.vcvtii.u82u32.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %ii_s82s32 = call <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %ii_s4x22s16 = call <128 x i16> @llvm.hivm.vcvtii.s4x22s16.x(<256 x i8> undef, <256 x i1> %mask, i32 0)
  %ii_u322u8 = call <256 x i8> @llvm.hivm.vcvtii.u322u8.x(<64 x i32> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_s322u8 = call <256 x i8> @llvm.hivm.vcvtii.s322u8.x(<64 x i32> undef, <256 x i1> %mask, i32 0, i32 0)
  %ii_s162s4x2 = call <256 x i8> @llvm.hivm.vcvtii.s162s4x2.x(<128 x i16> undef, <256 x i1> %mask, i32 0, i32 0)

  %ff_f322f16 = call <128 x half> @llvm.hivm.vcvtff.f322f16.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %ff_f322bf16 = call <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %ff_f322f8e4m3 = call <256 x float8e4m3> @llvm.hivm.vcvtff.f322f8e4m3.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %ff_f322f8e5m2 = call <256 x float8e5m2> @llvm.hivm.vcvtff.f322f8e5m2.x(<64 x float> undef, <256 x i1> %mask, i32 0, i32 0, i32 0)
  %ff_f8e4m32f32 = call <64 x float> @llvm.hivm.vcvtff.f8e4m32f32.x(<256 x float8e4m3> undef, <256 x i1> %mask, i32 0)
  %ff_f8e5m22f32 = call <64 x float> @llvm.hivm.vcvtff.f8e5m22f32.x(<256 x float8e5m2> undef, <256 x i1> %mask, i32 0)
  %ff_f162f32 = call <64 x float> @llvm.hivm.vcvtff.f162f32.x(<128 x half> undef, <256 x i1> %mask, i32 0)
  %ff_bf162f32 = call <64 x float> @llvm.hivm.vcvtff.bf162f32.x(<128 x bfloat> undef, <256 x i1> %mask, i32 0)
  %ff_f162bf16 = call <128 x bfloat> @llvm.hivm.vcvtff.f162bf16.x(<128 x half> undef, <256 x i1> %mask, i32 0)
  %ff_bf162f16 = call <128 x half> @llvm.hivm.vcvtff.bf162f16.x(<128 x bfloat> undef, <256 x i1> %mask, i32 0, i32 0)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x float> @llvm.hivm.vtrc.f32.x(<64 x float>, i32, <256 x i1>)
declare <128 x half> @llvm.hivm.vtrc.f16.x(<128 x half>, i32, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vtrc.bf16.x(<128 x bfloat>, i32, <256 x i1>)
declare <128 x half> @llvm.hivm.vcvtif.u82f16.x(<256 x i8>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vcvtif.s82f16.x(<256 x i8>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vcvtif.s162f32.x(<128 x i16>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vcvtif.s162f16.x(<128 x i16>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vcvtif.s322f32.x(<64 x i32>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vcvtif.s4x22f16.x(<256 x i8>, <256 x i1>, i32)
declare <128 x bfloat> @llvm.hivm.vcvtif.s4x22bf16.x(<256 x i8>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vcvtif.s642f32.x(<32 x i64>, <256 x i1>, i32, i32)
declare <64 x i32> @llvm.hivm.vcvtfi.f322s32.x(<64 x float>, <256 x i1>, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtfi.f162s16.x(<128 x half>, <256 x i1>, i32, i32)
declare <64 x i32> @llvm.hivm.vcvtfi.f162s32.x(<128 x half>, <256 x i1>, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtfi.f162u8.x(<128 x half>, <256 x i1>, i32, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtfi.f162s8.x(<128 x half>, <256 x i1>, i32, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtfi.f322s16.x(<64 x float>, <256 x i1>, i32, i32, i32)
declare <32 x i64> @llvm.hivm.vcvtfi.f322s64.x(<64 x float>, <256 x i1>, i32, i32, i32)
declare <64 x i32> @llvm.hivm.vcvtfi.bf162s32.x(<128 x bfloat>, <256 x i1>, i32, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtfi.f162s4x2.x(<128 x half>, <256 x i1>, i32, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtii.u162u8.x(<128 x i16>, <256 x i1>, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtii.s162u8.x(<128 x i16>, <256 x i1>, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtii.s322s16.x(<64 x i32>, <256 x i1>, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtii.s322u16.x(<64 x i32>, <256 x i1>, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtii.u322u16.x(<64 x i32>, <256 x i1>, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtii.u322s16.x(<64 x i32>, <256 x i1>, i32, i32)
declare <64 x i32> @llvm.hivm.vcvtii.s642s32.x(<32 x i64>, <256 x i1>, i32, i32)
declare <128 x i16> @llvm.hivm.vcvtii.u82u16.x(<256 x i8>, <256 x i1>, i32)
declare <128 x i16> @llvm.hivm.vcvtii.s82s16.x(<256 x i8>, <256 x i1>, i32)
declare <64 x i32> @llvm.hivm.vcvtii.s162s32.x(<128 x i16>, <256 x i1>, i32)
declare <64 x i32> @llvm.hivm.vcvtii.s162u32.x(<128 x i16>, <256 x i1>, i32)
declare <64 x i32> @llvm.hivm.vcvtii.u162u32.x(<128 x i16>, <256 x i1>, i32)
declare <32 x i64> @llvm.hivm.vcvtii.s322s64.x(<64 x i32>, <256 x i1>, i32)
declare <64 x i32> @llvm.hivm.vcvtii.u82u32.x(<256 x i8>, <256 x i1>, i32)
declare <64 x i32> @llvm.hivm.vcvtii.s82s32.x(<256 x i8>, <256 x i1>, i32)
declare <128 x i16> @llvm.hivm.vcvtii.s4x22s16.x(<256 x i8>, <256 x i1>, i32)
declare <256 x i8> @llvm.hivm.vcvtii.u322u8.x(<64 x i32>, <256 x i1>, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtii.s322u8.x(<64 x i32>, <256 x i1>, i32, i32)
declare <256 x i8> @llvm.hivm.vcvtii.s162s4x2.x(<128 x i16>, <256 x i1>, i32, i32)
declare <128 x half> @llvm.hivm.vcvtff.f322f16.x(<64 x float>, <256 x i1>, i32, i32, i32)
declare <128 x bfloat> @llvm.hivm.vcvtff.f322bf16.x(<64 x float>, <256 x i1>, i32, i32, i32)
declare <256 x float8e4m3> @llvm.hivm.vcvtff.f322f8e4m3.x(<64 x float>, <256 x i1>, i32, i32, i32)
declare <256 x float8e5m2> @llvm.hivm.vcvtff.f322f8e5m2.x(<64 x float>, <256 x i1>, i32, i32, i32)
declare <64 x float> @llvm.hivm.vcvtff.f8e4m32f32.x(<256 x float8e4m3>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vcvtff.f8e5m22f32.x(<256 x float8e5m2>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vcvtff.f162f32.x(<128 x half>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vcvtff.bf162f32.x(<128 x bfloat>, <256 x i1>, i32)
declare <128 x bfloat> @llvm.hivm.vcvtff.f162bf16.x(<128 x half>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vcvtff.bf162f16.x(<128 x bfloat>, <256 x i1>, i32, i32)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
