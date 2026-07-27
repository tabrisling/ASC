; Direct LLVM IR probe for fail-closed P1 floating reduction/prelu coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)

  %vcgadd_f32 = call <64 x float> @llvm.hivm.vcgadd.s.x.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcgadd_f16 = call <128 x half> @llvm.hivm.vcgadd.s.x.v128f16(<128 x half> undef, <256 x i1> %mask16)
  %vcgmax_f32 = call <64 x float> @llvm.hivm.vcgmax.s.x.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcgmax_f16 = call <128 x half> @llvm.hivm.vcgmax.s.x.v128f16(<128 x half> undef, <256 x i1> %mask16)
  %vcgmin_f32 = call <64 x float> @llvm.hivm.vcgmin.s.x.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcgmin_f16 = call <128 x half> @llvm.hivm.vcgmin.s.x.v128f16(<128 x half> undef, <256 x i1> %mask16)
  %vcpadd_f32 = call <64 x float> @llvm.hivm.vcpadd.x.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcpadd_f16 = call <128 x half> @llvm.hivm.vcpadd.x.v128f16(<128 x half> undef, <256 x i1> %mask16)

  %vcbmax_f32_x = call { <64 x float>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcbmax_f32_m = call { <64 x float>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcbmax_f16_x = call { <128 x half>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v128f16(<128 x half> undef, <256 x i1> %mask16)
  %vcbmax_f16_m = call { <128 x half>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v128f16(<128 x half> undef, <256 x i1> %mask16)
  %vcbmin_f32_x = call { <64 x float>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcbmin_f32_m = call { <64 x float>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v64f32(<64 x float> undef, <256 x i1> %mask32)
  %vcbmin_f16_x = call { <128 x half>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v128f16(<128 x half> undef, <256 x i1> %mask16)
  %vcbmin_f16_m = call { <128 x half>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v128f16(<128 x half> undef, <256 x i1> %mask16)

  %prelu_f32_m = call <64 x float> @llvm.hivm.vprelu.m.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %prelu_f32_x = call <64 x float> @llvm.hivm.vprelu.x.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %prelu_f32_z = call <64 x float> @llvm.hivm.vprelu.z.v64f32(<64 x float> undef, <64 x float> undef, <256 x i1> %mask32)
  %prelu_f16_m = call <128 x half> @llvm.hivm.vprelu.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %prelu_f16_x = call <128 x half> @llvm.hivm.vprelu.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  %prelu_f16_z = call <128 x half> @llvm.hivm.vprelu.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask16)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <64 x float> @llvm.hivm.vcgadd.s.x.v64f32(<64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vcgadd.s.x.v128f16(<128 x half>, <256 x i1>)
declare <64 x float> @llvm.hivm.vcgmax.s.x.v64f32(<64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vcgmax.s.x.v128f16(<128 x half>, <256 x i1>)
declare <64 x float> @llvm.hivm.vcgmin.s.x.v64f32(<64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vcgmin.s.x.v128f16(<128 x half>, <256 x i1>)
declare <64 x float> @llvm.hivm.vcpadd.x.v64f32(<64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vcpadd.x.v128f16(<128 x half>, <256 x i1>)
declare { <64 x float>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v64f32(<64 x float>, <256 x i1>)
declare { <64 x float>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v64f32(<64 x float>, <256 x i1>)
declare { <128 x half>, <256 x i1> } @llvm.hivm.vcbmax.s.x.v128f16(<128 x half>, <256 x i1>)
declare { <128 x half>, <256 x i1> } @llvm.hivm.vcbmax.s.m.v128f16(<128 x half>, <256 x i1>)
declare { <64 x float>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v64f32(<64 x float>, <256 x i1>)
declare { <64 x float>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v64f32(<64 x float>, <256 x i1>)
declare { <128 x half>, <256 x i1> } @llvm.hivm.vcbmin.s.x.v128f16(<128 x half>, <256 x i1>)
declare { <128 x half>, <256 x i1> } @llvm.hivm.vcbmin.s.m.v128f16(<128 x half>, <256 x i1>)
declare <64 x float> @llvm.hivm.vprelu.m.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vprelu.x.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <64 x float> @llvm.hivm.vprelu.z.v64f32(<64 x float>, <64 x float>, <256 x i1>)
declare <128 x half> @llvm.hivm.vprelu.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vprelu.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vprelu.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
