; Direct LLVM IR probe for fail-closed P1 floating sequence/rearrange coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %vci_f32 = call <64 x float> @llvm.hivm.vci.v64f32(float 0.000000e+00, i32 0)
  %vci_f16 = call <128 x half> @llvm.hivm.vci.v128f16(half 0xH0000, i32 1)
  %vci_bf16 = call <128 x bfloat> @llvm.hivm.vci.v128bf16(bfloat 0xR0000, i32 0)

  %intlv_f32 = call { <64 x float>, <64 x float> } @llvm.hivm.vintlv.v64f32(<64 x float> undef, <64 x float> undef)
  %intlv_f16 = call { <128 x half>, <128 x half> } @llvm.hivm.vintlv.v128f16(<128 x half> undef, <128 x half> undef)
  %intlv_bf16 = call { <128 x bfloat>, <128 x bfloat> } @llvm.hivm.vintlv.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef)
  %dintlv_f32 = call { <64 x float>, <64 x float> } @llvm.hivm.vdintlv.v64f32(<64 x float> undef, <64 x float> undef)
  %dintlv_f16 = call { <128 x half>, <128 x half> } @llvm.hivm.vdintlv.v128f16(<128 x half> undef, <128 x half> undef)
  %dintlv_bf16 = call { <128 x bfloat>, <128 x bfloat> } @llvm.hivm.vdintlv.v128bf16(<128 x bfloat> undef, <128 x bfloat> undef)

  %slide_f32 = call <64 x float> @llvm.hivm.vslide.v64f32(<64 x float> undef, <64 x float> undef, i16 1)
  %slide_f16 = call <128 x half> @llvm.hivm.vslide.v128f16(<128 x half> undef, <128 x half> undef, i16 1)
  ret void
}

declare <64 x float> @llvm.hivm.vci.v64f32(float, i32)
declare <128 x half> @llvm.hivm.vci.v128f16(half, i32)
declare <128 x bfloat> @llvm.hivm.vci.v128bf16(bfloat, i32)
declare { <64 x float>, <64 x float> } @llvm.hivm.vintlv.v64f32(<64 x float>, <64 x float>)
declare { <128 x half>, <128 x half> } @llvm.hivm.vintlv.v128f16(<128 x half>, <128 x half>)
declare { <128 x bfloat>, <128 x bfloat> } @llvm.hivm.vintlv.v128bf16(<128 x bfloat>, <128 x bfloat>)
declare { <64 x float>, <64 x float> } @llvm.hivm.vdintlv.v64f32(<64 x float>, <64 x float>)
declare { <128 x half>, <128 x half> } @llvm.hivm.vdintlv.v128f16(<128 x half>, <128 x half>)
declare { <128 x bfloat>, <128 x bfloat> } @llvm.hivm.vdintlv.v128bf16(<128 x bfloat>, <128 x bfloat>)
declare <64 x float> @llvm.hivm.vslide.v64f32(<64 x float>, <64 x float>, i16)
declare <128 x half> @llvm.hivm.vslide.v128f16(<128 x half>, <128 x half>, i16)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
