; Minimal dav i32 memory block/gather LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_memory_blocks_i32. The block data
; is byte-addressed in UB, while vsldb/vgatherb expose it as packed i32 lanes
; before vstsx1 writes it back for a byte-wise GM copy.

define dso_local ptc_kernel void @dav_memory_blocks_i32(ptr addrspace(1) %data,
                                                        ptr addrspace(1) %offsets,
                                                        ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 32 to ptr addrspace(6)), ptr addrspace(1) %data, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %offsets, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %idx = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %loaded = call <64 x i32> @llvm.hivm.vsldb(ptr addrspace(6) null, i32 65537, i32 0, <256 x i1> %mask)
  %gathered = call <64 x i32> @llvm.hivm.vgatherb.v310.v64s32(ptr addrspace(6) inttoptr (i64 32 to ptr addrspace(6)), <64 x i32> %idx, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %loaded, ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %gathered, ptr addrspace(6) inttoptr (i64 1280 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6), i32, i32, i32)
declare <64 x i32> @llvm.hivm.vsldb(ptr addrspace(6), i32, i32, <256 x i1>)
declare <64 x i32> @llvm.hivm.vgatherb.v310.v64s32(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64s32(<64 x i32>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @dav_memory_blocks_i32, !"kernel", i32 1}
