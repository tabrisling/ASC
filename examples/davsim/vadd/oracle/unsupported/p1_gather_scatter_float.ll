; Direct LLVM IR probe for fail-closed P1 floating gather/scatter coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %gf32 = call <64 x float> @llvm.hivm.vgather.v64f32(ptr addrspace(6) null, <64 x i32> undef, <256 x i1> %mask)
  %gf16 = call <128 x half> @llvm.hivm.vgather.v128f16(ptr addrspace(6) null, <128 x i32> undef, <256 x i1> %mask)
  %gbf16 = call <128 x bfloat> @llvm.hivm.vgather.v128bf16(ptr addrspace(6) null, <128 x i32> undef, <256 x i1> %mask)
  call void @llvm.hivm.vscatter.v64f32(<64 x float> %gf32, ptr addrspace(6) null, <64 x i32> undef, <256 x i1> %mask)
  call void @llvm.hivm.vscatter.v128f16(<128 x half> %gf16, ptr addrspace(6) null, <128 x i32> undef, <256 x i1> %mask)
  call void @llvm.hivm.vscatter.v128bf16(<128 x bfloat> %gbf16, ptr addrspace(6) null, <128 x i32> undef, <256 x i1> %mask)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x float> @llvm.hivm.vgather.v64f32(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x half> @llvm.hivm.vgather.v128f16(ptr addrspace(6), <128 x i32>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vgather.v128bf16(ptr addrspace(6), <128 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v64f32(<64 x float>, ptr addrspace(6), <64 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v128f16(<128 x half>, ptr addrspace(6), <128 x i32>, <256 x i1>)
declare void @llvm.hivm.vscatter.v128bf16(<128 x bfloat>, ptr addrspace(6), <128 x i32>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
