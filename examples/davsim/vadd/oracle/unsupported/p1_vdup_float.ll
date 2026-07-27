; Direct LLVM IR probe for fail-closed P1 floating vdup/vdupv coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)

  %dup_f32_m = call <64 x float> @llvm.hivm.vdup.m.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32, i32 2)
  %dup_f32_x = call <64 x float> @llvm.hivm.vdup.x.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32, i32 1)
  %dup_f32_z = call <64 x float> @llvm.hivm.vdup.z.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32, i32 0)
  %dup_f16_m = call <128 x half> @llvm.hivm.vdup.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16, i32 2)
  %dup_f16_x = call <128 x half> @llvm.hivm.vdup.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16, i32 1)
  %dup_f16_z = call <128 x half> @llvm.hivm.vdup.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16, i32 0)
  %dup_bf16_m = call <128 x bfloat> @llvm.hivm.vdup.m.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16, i32 2)
  %dup_bf16_x = call <128 x bfloat> @llvm.hivm.vdup.x.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16, i32 1)
  %dup_bf16_z = call <128 x bfloat> @llvm.hivm.vdup.z.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16, i32 0)

  %dupv_f32 = call <64 x float> @llvm.hivm.vdupv.v64f32(<64 x float> undef, i1 false)
  %dupv_f16 = call <128 x half> @llvm.hivm.vdupv.v128f16(<128 x half> undef, i1 true)
  %dupv_bf16 = call <128 x bfloat> @llvm.hivm.vdupv.v128bf16(<128 x bfloat> undef, i1 false)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <64 x float> @llvm.hivm.vdup.m.v64f32(<64 x float>, <64 x float>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vdup.x.v64f32(<64 x float>, <64 x float>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vdup.z.v64f32(<64 x float>, <64 x float>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vdup.m.v128f16(<128 x half>, <128 x half>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vdup.x.v128f16(<128 x half>, <128 x half>, <256 x i1>, i32)
declare <128 x half> @llvm.hivm.vdup.z.v128f16(<128 x half>, <128 x half>, <256 x i1>, i32)
declare <128 x bfloat> @llvm.hivm.vdup.m.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>, i32)
declare <128 x bfloat> @llvm.hivm.vdup.x.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>, i32)
declare <128 x bfloat> @llvm.hivm.vdup.z.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>, i32)
declare <64 x float> @llvm.hivm.vdupv.v64f32(<64 x float>, i1)
declare <128 x half> @llvm.hivm.vdupv.v128f16(<128 x half>, i1)
declare <128 x bfloat> @llvm.hivm.vdupv.v128bf16(<128 x bfloat>, i1)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
