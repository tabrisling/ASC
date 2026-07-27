; Direct LLVM IR probe for fail-closed P1 floating memory intrinsic coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)

  %ld_f32 = call <64 x float> @llvm.hivm.vld.v64f32(ptr addrspace(6) null, i32 0, <256 x i1> %mask32)
  %ld_f16 = call <128 x half> @llvm.hivm.vld.v128f16(ptr addrspace(6) null, i32 0, <256 x i1> %mask16)
  %ld_bf16 = call <128 x bfloat> @llvm.hivm.vld.v128bf16(ptr addrspace(6) null, i32 0, <256 x i1> %mask16)

  call void @llvm.hivm.vst.v64f32(<64 x float> %ld_f32, ptr addrspace(6) null, i32 0, <256 x i1> %mask32)
  call void @llvm.hivm.vst.v128f16(<128 x half> %ld_f16, ptr addrspace(6) null, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vst.v128bf16(<128 x bfloat> %ld_bf16, ptr addrspace(6) null, i32 0, <256 x i1> %mask16)

  call void @llvm.hivm.vsstb.v64f32(<64 x float> %ld_f32, ptr addrspace(6) null, i32 0, i32 0, <256 x i1> %mask32)
  call void @llvm.hivm.vsstb.v128f16(<128 x half> %ld_f16, ptr addrspace(6) null, i32 0, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vsstb.v128bf16(<128 x bfloat> %ld_bf16, ptr addrspace(6) null, i32 0, i32 0, <256 x i1> %mask16)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <64 x float> @llvm.hivm.vld.v64f32(ptr addrspace(6), i32, <256 x i1>)
declare <128 x half> @llvm.hivm.vld.v128f16(ptr addrspace(6), i32, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vld.v128bf16(ptr addrspace(6), i32, <256 x i1>)
declare void @llvm.hivm.vst.v64f32(<64 x float>, ptr addrspace(6), i32, <256 x i1>)
declare void @llvm.hivm.vst.v128f16(<128 x half>, ptr addrspace(6), i32, <256 x i1>)
declare void @llvm.hivm.vst.v128bf16(<128 x bfloat>, ptr addrspace(6), i32, <256 x i1>)
declare void @llvm.hivm.vsstb.v64f32(<64 x float>, ptr addrspace(6), i32, i32, <256 x i1>)
declare void @llvm.hivm.vsstb.v128f16(<128 x half>, ptr addrspace(6), i32, i32, <256 x i1>)
declare void @llvm.hivm.vsstb.v128bf16(<128 x bfloat>, ptr addrspace(6), i32, i32, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
