; Direct LLVM IR probe for fail-closed P2 wide multiply and saturated binary coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)

  %vmula = call <64 x float> @llvm.hivm.vmula.s.m(<64 x float> undef, <64 x float> undef, <64 x float> undef, <256 x i1> %mask)

  %s16_m = call { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.s.m.v64i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask, <64 x i16> undef)
  %s16_x = call { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.s.x.v64i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask, <64 x i16> undef)
  %s16_z = call { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.s.z.v64i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask, <64 x i16> undef)
  %u16_m = call { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.u.m.v64i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask, <64 x i16> undef)
  %u16_x = call { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.u.x.v64i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask, <64 x i16> undef)
  %u16_z = call { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.u.z.v64i16(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask, <64 x i16> undef)

  %s32_m = call { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.s.m.v32i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask, <32 x i32> undef)
  %s32_x = call { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.s.x.v32i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask, <32 x i32> undef)
  %s32_z = call { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.s.z.v32i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask, <32 x i32> undef)
  %u32_m = call { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.u.m.v32i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask, <32 x i32> undef)
  %u32_x = call { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.u.x.v32i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask, <32 x i32> undef)
  %u32_z = call { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.u.z.v32i32(<64 x i32> undef, <64 x i32> undef, <256 x i1> %mask, <32 x i32> undef)

  %sadd_m = call <128 x i16> @llvm.hivm.sadd.v128s16.m(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask)
  %sadd_x = call <128 x i16> @llvm.hivm.sadd.v128s16.x(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask)
  %sadd_z = call <128 x i16> @llvm.hivm.sadd.v128s16.z(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask)
  %ssub_m = call <128 x i16> @llvm.hivm.ssub.v128s16.m(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask)
  %ssub_x = call <128 x i16> @llvm.hivm.ssub.v128s16.x(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask)
  %ssub_z = call <128 x i16> @llvm.hivm.ssub.v128s16.z(<128 x i16> undef, <128 x i16> undef, <256 x i1> %mask)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x float> @llvm.hivm.vmula.s.m(<64 x float>, <64 x float>, <64 x float>, <256 x i1>)
declare { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.s.m.v64i16(<128 x i16>, <128 x i16>, <256 x i1>, <64 x i16>)
declare { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.s.x.v64i16(<128 x i16>, <128 x i16>, <256 x i1>, <64 x i16>)
declare { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.s.z.v64i16(<128 x i16>, <128 x i16>, <256 x i1>, <64 x i16>)
declare { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.u.m.v64i16(<128 x i16>, <128 x i16>, <256 x i1>, <64 x i16>)
declare { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.u.x.v64i16(<128 x i16>, <128 x i16>, <256 x i1>, <64 x i16>)
declare { <64 x i16>, <64 x i16> } @llvm.hivm.vmull.u.z.v64i16(<128 x i16>, <128 x i16>, <256 x i1>, <64 x i16>)
declare { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.s.m.v32i32(<64 x i32>, <64 x i32>, <256 x i1>, <32 x i32>)
declare { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.s.x.v32i32(<64 x i32>, <64 x i32>, <256 x i1>, <32 x i32>)
declare { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.s.z.v32i32(<64 x i32>, <64 x i32>, <256 x i1>, <32 x i32>)
declare { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.u.m.v32i32(<64 x i32>, <64 x i32>, <256 x i1>, <32 x i32>)
declare { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.u.x.v32i32(<64 x i32>, <64 x i32>, <256 x i1>, <32 x i32>)
declare { <32 x i32>, <32 x i32> } @llvm.hivm.vmull.u.z.v32i32(<64 x i32>, <64 x i32>, <256 x i1>, <32 x i32>)
declare <128 x i16> @llvm.hivm.sadd.v128s16.m(<128 x i16>, <128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.sadd.v128s16.x(<128 x i16>, <128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.sadd.v128s16.z(<128 x i16>, <128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.ssub.v128s16.m(<128 x i16>, <128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.ssub.v128s16.x(<128 x i16>, <128 x i16>, <256 x i1>)
declare <128 x i16> @llvm.hivm.ssub.v128s16.z(<128 x i16>, <128 x i16>, <256 x i1>)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
