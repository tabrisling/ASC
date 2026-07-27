; Minimal dav u32 carry/borrow LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_carry_u32: GM uint32 inputs are
; copied to UB, loaded into i32 registers, passed through add/sub carry
; intrinsics, predicate results are materialized with vsel, and eight 64-lane
; output blocks are copied back to GM.

define dso_local ptc_kernel void @dav_carry_u32(ptr addrspace(1) %lhs,
                                                ptr addrspace(1) %rhs,
                                                ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) null, ptr addrspace(1) %lhs, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s32.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %rhs, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %vlhs = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %vrhs = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %zero = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 0, <256 x i1> %mask, i32 0)
  %one = call <64 x i32> @llvm.hivm.vdups.z.v64i32(i32 1, <256 x i1> %mask, i32 0)
  %add_agg = call { <64 x i32>, <256 x i1> } @llvm.hivm.vaddc.v64u32(<64 x i32> %vlhs, <64 x i32> %vrhs, <256 x i1> %mask)
  %add = extractvalue { <64 x i32>, <256 x i1> } %add_agg, 0
  %add_pred = extractvalue { <64 x i32>, <256 x i1> } %add_agg, 1
  %sub_agg = call { <64 x i32>, <256 x i1> } @llvm.hivm.vsubc.v64u32(<64 x i32> %vlhs, <64 x i32> %vrhs, <256 x i1> %mask)
  %sub = extractvalue { <64 x i32>, <256 x i1> } %sub_agg, 0
  %sub_pred = extractvalue { <64 x i32>, <256 x i1> } %sub_agg, 1
  %addcs_agg = call { <64 x i32>, <256 x i1> } @llvm.hivm.vaddcs.v64u32(<64 x i32> %vlhs, <64 x i32> %vrhs, <256 x i1> %add_pred, <256 x i1> %mask)
  %addcs = extractvalue { <64 x i32>, <256 x i1> } %addcs_agg, 0
  %addcs_pred = extractvalue { <64 x i32>, <256 x i1> } %addcs_agg, 1
  %subcs_agg = call { <64 x i32>, <256 x i1> } @llvm.hivm.vsubcs.v64u32(<64 x i32> %vlhs, <64 x i32> %vrhs, <256 x i1> %sub_pred, <256 x i1> %mask)
  %subcs = extractvalue { <64 x i32>, <256 x i1> } %subcs_agg, 0
  %subcs_pred = extractvalue { <64 x i32>, <256 x i1> } %subcs_agg, 1
  %add_carry = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %one, <64 x i32> %zero, <256 x i1> %add_pred)
  %sub_carry = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %one, <64 x i32> %zero, <256 x i1> %sub_pred)
  %addcs_carry = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %one, <64 x i32> %zero, <256 x i1> %addcs_pred)
  %subcs_carry = call <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32> %one, <64 x i32> %zero, <256 x i1> %subcs_pred)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %add, ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %add_carry, ptr addrspace(6) inttoptr (i64 1280 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %sub, ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %sub_carry, ptr addrspace(6) inttoptr (i64 1792 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %addcs, ptr addrspace(6) inttoptr (i64 2048 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %addcs_carry, ptr addrspace(6) inttoptr (i64 2304 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %subcs, ptr addrspace(6) inttoptr (i64 2560 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %subcs_carry, ptr addrspace(6) inttoptr (i64 2816 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i64 288230377225454592, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6), i32, i32, i32)
declare <64 x i32> @llvm.hivm.vdups.z.v64i32(i32, <256 x i1>, i32)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vaddc.v64u32(<64 x i32>, <64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vsubc.v64u32(<64 x i32>, <64 x i32>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vaddcs.v64u32(<64 x i32>, <64 x i32>, <256 x i1>, <256 x i1>)
declare { <64 x i32>, <256 x i1> } @llvm.hivm.vsubcs.v64u32(<64 x i32>, <64 x i32>, <256 x i1>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vsel.v64i32(<64 x i32>, <64 x i32>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64s32(<64 x i32>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
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
!1 = !{ptr @dav_carry_u32, !"kernel", i32 1}
