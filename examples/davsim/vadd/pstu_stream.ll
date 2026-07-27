; Minimal dav predicate stream LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_pstu_stream: predicates from
; plt.b16/plt.b32 are streamed into UB through pstu and the resulting bytes are
; copied back to GM.

define dso_local ptc_kernel void @dav_pstu_stream(ptr addrspace(1) %seed,
                                                  ptr addrspace(1) %output) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %seed, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)

  %plt16_first = call { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32 1)
  %p16_first = extractvalue { <256 x i1>, i32 } %plt16_first, 0
  %plt16_last = call { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32 127)
  %p16_last = extractvalue { <256 x i1>, i32 } %plt16_last, 0
  %a16_0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %s16_1 = call { <32 x i8>, ptr addrspace(6) } @llvm.hivm.pstu.b16(<256 x i1> %p16_first, ptr addrspace(6) null, <32 x i8> %a16_0)
  %a16_1 = extractvalue { <32 x i8>, ptr addrspace(6) } %s16_1, 0
  %base16_1 = extractvalue { <32 x i8>, ptr addrspace(6) } %s16_1, 1
  %s16_2 = call { <32 x i8>, ptr addrspace(6) } @llvm.hivm.pstu.b16(<256 x i1> %p16_last, ptr addrspace(6) %base16_1, <32 x i8> %a16_1)
  %a16_2 = extractvalue { <32 x i8>, ptr addrspace(6) } %s16_2, 0
  %base16_2 = extractvalue { <32 x i8>, ptr addrspace(6) } %s16_2, 1
  call void @llvm.hivm.vstas(<32 x i8> %a16_2, ptr addrspace(6) %base16_2, i32 0, i32 0)

  %plt32_first = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 13)
  %p32_first = extractvalue { <256 x i1>, i32 } %plt32_first, 0
  %plt32_last = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 7)
  %p32_last = extractvalue { <256 x i1>, i32 } %plt32_last, 0
  %a32_0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %s32_1 = call { <32 x i8>, ptr addrspace(6) } @llvm.hivm.pstu.b32(<256 x i1> %p32_first, ptr addrspace(6) inttoptr (i64 32 to ptr addrspace(6)), <32 x i8> %a32_0)
  %a32_1 = extractvalue { <32 x i8>, ptr addrspace(6) } %s32_1, 0
  %base32_1 = extractvalue { <32 x i8>, ptr addrspace(6) } %s32_1, 1
  %s32_2 = call { <32 x i8>, ptr addrspace(6) } @llvm.hivm.pstu.b32(<256 x i1> %p32_last, ptr addrspace(6) %base32_1, <32 x i8> %a32_1)
  %a32_2 = extractvalue { <32 x i8>, ptr addrspace(6) } %s32_2, 0
  %base32_2 = extractvalue { <32 x i8>, ptr addrspace(6) } %s32_2, 1
  call void @llvm.hivm.vstas(<32 x i8> %a32_2, ptr addrspace(6) %base32_2, i32 0, i32 0)

  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %output, ptr addrspace(6) null, i64 8589935616, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32)
declare { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32)
declare <32 x i8> @llvm.hivm.init.vector.align.data()
declare { <32 x i8>, ptr addrspace(6) } @llvm.hivm.pstu.b16(<256 x i1>, ptr addrspace(6), <32 x i8>)
declare { <32 x i8>, ptr addrspace(6) } @llvm.hivm.pstu.b32(<256 x i1>, ptr addrspace(6), <32 x i8>)
declare void @llvm.hivm.vstas(<32 x i8>, ptr addrspace(6), i32, i32)
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
!1 = !{ptr @dav_pstu_stream, !"kernel", i32 1}
