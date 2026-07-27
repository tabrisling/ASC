; Direct LLVM IR probe for fail-closed P1 f16/bf16 scalar-vector coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %vadds_f16_m = call <128 x half> @llvm.hivm.vadds.s.m.v128f16(<128 x half> undef, half 0xH3C00, <256 x i1> %mask)
  %vadds_f16_x = call <128 x half> @llvm.hivm.vadds.s.x.v128f16(<128 x half> undef, half 0xH3C00, <256 x i1> %mask)
  %vmuls_f16_m = call <128 x half> @llvm.hivm.vmuls.s.m.v128f16(<128 x half> undef, half 0xH3C00, <256 x i1> %mask)
  %vmuls_f16_x = call <128 x half> @llvm.hivm.vmuls.s.x.v128f16(<128 x half> undef, half 0xH3C00, <256 x i1> %mask)
  %vmaxs_f16_x = call <128 x half> @llvm.hivm.vmaxs.s.x.v128f16(<128 x half> undef, half 0xH3C00, <256 x i1> %mask)
  %vmins_f16_x = call <128 x half> @llvm.hivm.vmins.s.x.v128f16(<128 x half> undef, half 0xH3C00, <256 x i1> %mask)
  %vadds_bf16_x = call <128 x bfloat> @llvm.hivm.vadds.s.x.v128bf16(<128 x bfloat> undef, bfloat 0xR3F80, <256 x i1> %mask)
  %vmaxs_bf16_x = call <128 x bfloat> @llvm.hivm.vmaxs.s.x.v128bf16(<128 x bfloat> undef, bfloat 0xR3F80, <256 x i1> %mask)
  %vmins_bf16_x = call <128 x bfloat> @llvm.hivm.vmins.s.x.v128bf16(<128 x bfloat> undef, bfloat 0xR3F80, <256 x i1> %mask)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <128 x half> @llvm.hivm.vadds.s.m.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x half> @llvm.hivm.vadds.s.x.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x half> @llvm.hivm.vmuls.s.m.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x half> @llvm.hivm.vmuls.s.x.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x half> @llvm.hivm.vmaxs.s.x.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x half> @llvm.hivm.vmins.s.x.v128f16(<128 x half>, half, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vadds.s.x.v128bf16(<128 x bfloat>, bfloat, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vmaxs.s.x.v128bf16(<128 x bfloat>, bfloat, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vmins.s.x.v128bf16(<128 x bfloat>, bfloat, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
