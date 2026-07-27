; Direct LLVM IR probe for fail-closed P1 floating vor/vxor modes.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)

  %vor_f32_m = call <64 x float> @llvm.hivm.vor.m.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %vor_f32_x = call <64 x float> @llvm.hivm.vor.x.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %vor_f32_z = call <64 x float> @llvm.hivm.vor.z.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %vor_f16_m = call <128 x half> @llvm.hivm.vor.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %vor_f16_x = call <128 x half> @llvm.hivm.vor.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %vor_f16_z = call <128 x half> @llvm.hivm.vor.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %vor_bf16_m = call <128 x bfloat> @llvm.hivm.vor.m.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16)
  %vor_bf16_x = call <128 x bfloat> @llvm.hivm.vor.x.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16)
  %vor_bf16_z = call <128 x bfloat> @llvm.hivm.vor.z.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16)

  %vxor_f32_m = call <64 x float> @llvm.hivm.vxor.m.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %vxor_f32_x = call <64 x float> @llvm.hivm.vxor.x.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %vxor_f32_z = call <64 x float> @llvm.hivm.vxor.z.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %vxor_f16_m = call <128 x half> @llvm.hivm.vxor.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %vxor_f16_x = call <128 x half> @llvm.hivm.vxor.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %vxor_f16_z = call <128 x half> @llvm.hivm.vxor.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %vxor_bf16_m = call <128 x bfloat> @llvm.hivm.vxor.m.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16)
  %vxor_bf16_x = call <128 x bfloat> @llvm.hivm.vxor.x.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16)
  %vxor_bf16_z = call <128 x bfloat> @llvm.hivm.vxor.z.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef, <256 x i1> %mask16)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <64 x float> @llvm.hivm.vor.m.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vor.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vor.z.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vor.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vor.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vor.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vor.m.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vor.x.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vor.z.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>)
declare <64 x float> @llvm.hivm.vxor.m.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vxor.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vxor.z.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vxor.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vxor.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vxor.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vxor.m.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vxor.x.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vxor.z.v128bf16(<128 x bfloat>, <128 x bfloat>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
