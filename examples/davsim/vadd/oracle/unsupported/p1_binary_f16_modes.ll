; Direct LLVM IR probe for fail-closed P1 f16 binary vector modes.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %vadd_m = call <128 x half> @llvm.hivm.vadd.s.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vadd_z = call <128 x half> @llvm.hivm.vadd.s.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vsub_x = call <128 x half> @llvm.hivm.vsub.s.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vsub_m = call <128 x half> @llvm.hivm.vsub.s.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vsub_z = call <128 x half> @llvm.hivm.vsub.s.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmul_x = call <128 x half> @llvm.hivm.vmul.s.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmul_m = call <128 x half> @llvm.hivm.vmul.s.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmul_z = call <128 x half> @llvm.hivm.vmul.s.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vdiv_m = call <128 x half> @llvm.hivm.vdiv.s.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vdiv_z = call <128 x half> @llvm.hivm.vdiv.s.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmax_m = call <128 x half> @llvm.hivm.vmax.s.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmax_z = call <128 x half> @llvm.hivm.vmax.s.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmin_x = call <128 x half> @llvm.hivm.vmin.s.x.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmin_m = call <128 x half> @llvm.hivm.vmin.s.m.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  %vmin_z = call <128 x half> @llvm.hivm.vmin.s.z.v128f16(<128 x half> undef, <128 x half> undef, <256 x i1> %mask)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <128 x half> @llvm.hivm.vadd.s.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vadd.s.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vsub.s.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vsub.s.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vsub.s.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmul.s.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmul.s.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmul.s.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vdiv.s.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vdiv.s.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmax.s.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmax.s.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmin.s.x.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmin.s.m.v128f16(<128 x half>, <128 x half>, <256 x i1>)
declare <128 x half> @llvm.hivm.vmin.s.z.v128f16(<128 x half>, <128 x half>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
