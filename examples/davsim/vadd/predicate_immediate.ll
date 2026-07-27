; Minimal dav predicate immediate LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_predicate_immediate: a full-active
; pset.b8 predicate is stored to UB at byte offset 4, read back through pldi.b8,
; materialized with psts.b8 at byte offset 0, then copied back to GM.

define dso_local ptc_kernel void @dav_predicate_immediate(ptr addrspace(1) %seed,
                                                          ptr addrspace(1) %output) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %seed, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %pred = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  call void @llvm.hivm.psti.b8(<256 x i1> %pred, ptr addrspace(6) null, i32 4, i32 0, i32 0)
  call void @llvm.hivm.mem.bar.vv.all()
  %loaded = call <256 x i1> @llvm.hivm.pldi.b8(ptr addrspace(6) null, i32 4, i32 0, i32 0)
  call void @llvm.hivm.psts.b8(<256 x i1> %loaded, ptr addrspace(6) null, i32 0, i32 0, i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) null, i64 288230377225453696, i64 281474976710912)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare void @llvm.hivm.psti.b8(<256 x i1>, ptr addrspace(6), i32, i32, i32)
declare void @llvm.hivm.mem.bar.vv.all()
declare <256 x i1> @llvm.hivm.pldi.b8(ptr addrspace(6), i32, i32, i32)
declare void @llvm.hivm.psts.b8(<256 x i1>, ptr addrspace(6), i32, i32, i32)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }

!llvm.module.flags = !{!0}
!hivm.annotations = !{!1}
!nvvm.annotations = !{}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{ptr @dav_predicate_immediate, !"kernel", i32 1}
