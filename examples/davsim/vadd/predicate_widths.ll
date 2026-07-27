; Minimal dav predicate byte load/store LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_predicate_widths: byte payloads
; are copied from GM to UB, round-tripped through plds.b8/psts.b8, then copied
; back to GM.

define dso_local ptc_kernel void @dav_predicate_widths(ptr addrspace(1) %seed,
                                                       ptr addrspace(1) %output) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %seed, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %p16 = call <256 x i1> @llvm.hivm.plds.b8(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  call void @llvm.hivm.psts.b8(<256 x i1> %p16, ptr addrspace(6) inttoptr (i64 128 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %p32 = call <256 x i1> @llvm.hivm.plds.b8(ptr addrspace(6) inttoptr (i64 32 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.psts.b8(<256 x i1> %p32, ptr addrspace(6) inttoptr (i64 160 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %p64 = call <256 x i1> @llvm.hivm.plds.b8(ptr addrspace(6) inttoptr (i64 64 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.psts.b8(<256 x i1> %p64, ptr addrspace(6) inttoptr (i64 192 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) null, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.plds.b8(ptr addrspace(6), i32, i32, i32)
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
!1 = !{ptr @dav_predicate_widths, !"kernel", i32 1}
