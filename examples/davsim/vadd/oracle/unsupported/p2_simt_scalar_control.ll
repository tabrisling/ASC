; Direct LLVM IR probe for fail-closed P2 SIMT scalar/control coverage.

target triple = "hiipu64-hisilicon-cce"

define dso_local ptc_kernel void @add_kernel(ptr addrspace(1) %0,
                                             ptr addrspace(1) %1,
                                             ptr addrspace(1) %2,
                                             i32 %3) #0 {
entry:
  %tid_x = call i32 @llvm.hivm.get.TID.X()
  %tid_y = call i32 @llvm.hivm.get.TID.Y()
  %tid_z = call i32 @llvm.hivm.get.TID.Z()
  %bid_x = call i32 @llvm.hivm.get.BLOCK.IDX.X()
  %bid_y = call i32 @llvm.hivm.get.BLOCK.IDX.Y()
  %bid_z = call i32 @llvm.hivm.get.BLOCK.IDX.Z()
  %bdim_x = call i32 @llvm.hivm.get.BLOCK.DIM.X()
  %bdim_y = call i32 @llvm.hivm.get.BLOCK.DIM.Y()
  %bdim_z = call i32 @llvm.hivm.get.BLOCK.DIM.Z()
  %block_idx = call i32 @llvm.hivm.tpe.get.BLOCK.IDX()
  %block_num = call i32 @llvm.hivm.tpe.get.BLOCK.NUM()
  %clock32 = call i32 @llvm.hivm.get.CLOCK32()
  %clock64 = call i64 @llvm.hivm.get.CLOCK64()
  %coreid = call i32 @llvm.hivm.tpe.get.COREID()

  call void @llvm.hivm.store.vfsimt.info(i64 0)
  call void @llvm.hivm.sync.workitems()

  %shfl_up_i32 = call i32 @llvm.hivm.shfl.up.i32(i32 %tid_x, i32 1, i32 31)
  %shfl_down_i32 = call i32 @llvm.hivm.shfl.down.i32(i32 %tid_y, i32 1, i32 31)
  %shfl_idx_i32 = call i32 @llvm.hivm.shfl.idx.i32(i32 %tid_z, i32 0, i32 31)
  %shfl_bfly_i32 = call i32 @llvm.hivm.shfl.bfly.i32(i32 %coreid, i32 1, i32 31)

  %shfl_up_i64 = call i64 @llvm.hivm.shfl.up.i64(i64 %clock64, i32 1, i32 31)
  %shfl_down_i64 = call i64 @llvm.hivm.shfl.down.i64(i64 %clock64, i32 1, i32 31)
  %shfl_idx_i64 = call i64 @llvm.hivm.shfl.idx.i64(i64 %clock64, i32 0, i32 31)
  %shfl_bfly_i64 = call i64 @llvm.hivm.shfl.bfly.i64(i64 %clock64, i32 1, i32 31)

  %shfl_up_f32 = call float @llvm.hivm.shfl.up.f32(float 0.000000e+00, i32 1, i32 31)
  %shfl_down_f32 = call float @llvm.hivm.shfl.down.f32(float 0.000000e+00, i32 1, i32 31)
  %shfl_idx_f32 = call float @llvm.hivm.shfl.idx.f32(float 0.000000e+00, i32 0, i32 31)
  %shfl_bfly_f32 = call float @llvm.hivm.shfl.bfly.f32(float 0.000000e+00, i32 1, i32 31)

  %shfl_up_f16 = call half @llvm.hivm.shfl.up.f16(half 0.000000e+00, i32 1, i32 31)
  %shfl_down_f16 = call half @llvm.hivm.shfl.down.f16(half 0.000000e+00, i32 1, i32 31)
  %shfl_idx_f16 = call half @llvm.hivm.shfl.idx.f16(half 0.000000e+00, i32 0, i32 31)
  %shfl_bfly_f16 = call half @llvm.hivm.shfl.bfly.f16(half 0.000000e+00, i32 1, i32 31)

  %shfl_up_v2f16 = call <2 x half> @llvm.hivm.shfl.up.v2f16(<2 x half> zeroinitializer, i32 1, i32 31)
  %shfl_down_v2f16 = call <2 x half> @llvm.hivm.shfl.down.v2f16(<2 x half> zeroinitializer, i32 1, i32 31)
  %shfl_idx_v2f16 = call <2 x half> @llvm.hivm.shfl.idx.v2f16(<2 x half> zeroinitializer, i32 0, i32 31)
  %shfl_bfly_v2f16 = call <2 x half> @llvm.hivm.shfl.bfly.v2f16(<2 x half> zeroinitializer, i32 1, i32 31)

  %red_add_f32 = call float @llvm.hivm.redux.add.f32(float %shfl_up_f32)
  %red_max_f32 = call float @llvm.hivm.redux.max.f32(float %shfl_down_f32)
  %red_min_f32 = call float @llvm.hivm.redux.min.f32(float %shfl_idx_f32)
  %red_add_f16 = call half @llvm.hivm.redux.add.f16(half %shfl_up_f16)
  %red_max_f16 = call half @llvm.hivm.redux.max.f16(half %shfl_down_f16)
  %red_min_f16 = call half @llvm.hivm.redux.min.f16(half %shfl_idx_f16)

  %rint_f = call float @llvm.hivm.rintf(float %red_add_f32)
  %round_f = call float @llvm.hivm.roundf(float %red_max_f32)
  %floor_f = call float @llvm.hivm.floorf(float %red_min_f32)
  %ceil_f = call float @llvm.hivm.ceilf(float %shfl_bfly_f32)
  %rint_h = call half @llvm.hivm.rinth(half %red_add_f16)
  %round_h = call half @llvm.hivm.roundh(half %red_max_f16)
  %floor_h = call half @llvm.hivm.floorh(half %red_min_f16)
  %ceil_h = call half @llvm.hivm.ceilh(half %shfl_bfly_f16)
  %rint_y = call bfloat @llvm.hivm.rinty(bfloat 0.000000e+00)
  %round_y = call bfloat @llvm.hivm.roundy(bfloat %rint_y)
  %floor_y = call bfloat @llvm.hivm.floory(bfloat %round_y)
  %ceil_y = call bfloat @llvm.hivm.ceily(bfloat %floor_y)

  ret void
}

declare i32 @llvm.hivm.get.TID.X()
declare i32 @llvm.hivm.get.TID.Y()
declare i32 @llvm.hivm.get.TID.Z()
declare i32 @llvm.hivm.get.BLOCK.IDX.X()
declare i32 @llvm.hivm.get.BLOCK.IDX.Y()
declare i32 @llvm.hivm.get.BLOCK.IDX.Z()
declare i32 @llvm.hivm.get.BLOCK.DIM.X()
declare i32 @llvm.hivm.get.BLOCK.DIM.Y()
declare i32 @llvm.hivm.get.BLOCK.DIM.Z()
declare i32 @llvm.hivm.tpe.get.BLOCK.IDX()
declare i32 @llvm.hivm.tpe.get.BLOCK.NUM()
declare i32 @llvm.hivm.get.CLOCK32()
declare i64 @llvm.hivm.get.CLOCK64()
declare i32 @llvm.hivm.tpe.get.COREID()
declare void @llvm.hivm.store.vfsimt.info(i64)
declare void @llvm.hivm.sync.workitems()
declare i32 @llvm.hivm.shfl.up.i32(i32, i32, i32)
declare i32 @llvm.hivm.shfl.down.i32(i32, i32, i32)
declare i32 @llvm.hivm.shfl.idx.i32(i32, i32, i32)
declare i32 @llvm.hivm.shfl.bfly.i32(i32, i32, i32)
declare i64 @llvm.hivm.shfl.up.i64(i64, i32, i32)
declare i64 @llvm.hivm.shfl.down.i64(i64, i32, i32)
declare i64 @llvm.hivm.shfl.idx.i64(i64, i32, i32)
declare i64 @llvm.hivm.shfl.bfly.i64(i64, i32, i32)
declare float @llvm.hivm.shfl.up.f32(float, i32, i32)
declare float @llvm.hivm.shfl.down.f32(float, i32, i32)
declare float @llvm.hivm.shfl.idx.f32(float, i32, i32)
declare float @llvm.hivm.shfl.bfly.f32(float, i32, i32)
declare half @llvm.hivm.shfl.up.f16(half, i32, i32)
declare half @llvm.hivm.shfl.down.f16(half, i32, i32)
declare half @llvm.hivm.shfl.idx.f16(half, i32, i32)
declare half @llvm.hivm.shfl.bfly.f16(half, i32, i32)
declare <2 x half> @llvm.hivm.shfl.up.v2f16(<2 x half>, i32, i32)
declare <2 x half> @llvm.hivm.shfl.down.v2f16(<2 x half>, i32, i32)
declare <2 x half> @llvm.hivm.shfl.idx.v2f16(<2 x half>, i32, i32)
declare <2 x half> @llvm.hivm.shfl.bfly.v2f16(<2 x half>, i32, i32)
declare float @llvm.hivm.redux.add.f32(float)
declare float @llvm.hivm.redux.max.f32(float)
declare float @llvm.hivm.redux.min.f32(float)
declare half @llvm.hivm.redux.add.f16(half)
declare half @llvm.hivm.redux.max.f16(half)
declare half @llvm.hivm.redux.min.f16(half)
declare float @llvm.hivm.rintf(float)
declare float @llvm.hivm.roundf(float)
declare float @llvm.hivm.floorf(float)
declare float @llvm.hivm.ceilf(float)
declare half @llvm.hivm.rinth(half)
declare half @llvm.hivm.roundh(half)
declare half @llvm.hivm.floorh(half)
declare half @llvm.hivm.ceilh(half)
declare bfloat @llvm.hivm.rinty(bfloat)
declare bfloat @llvm.hivm.roundy(bfloat)
declare bfloat @llvm.hivm.floory(bfloat)
declare bfloat @llvm.hivm.ceily(bfloat)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @add_kernel, !"kernel", i32 1}
