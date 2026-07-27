; Additional dav stateful-store LLVM IR smoke tests for tools/asc-sim.
;
; These mirror the OpenTileAS a5_stateful_store f16/bf16/i16/i8 cases at the
; byte behavior level: GM data and seed buffers are copied into UB, prefix-active
; lanes are stored through vstus/vstas and vsqz/vstur/vstar, then both 256B seed
; regions are copied back to GM.

define dso_local ptc_kernel void @dav_stateful_store_f16(ptr addrspace(1) %data,
                                                         ptr addrspace(1) %seed_vstus,
                                                         ptr addrspace(1) %seed_vstur,
                                                         ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %data, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %seed_vstus, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), ptr addrspace(1) %seed_vstur, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.sprclr(i16 74)
  %value = call <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %plt = call { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32 33)
  %pred = extractvalue { <256 x i1>, i32 } %plt, 0
  %packed = call <128 x half> @llvm.hivm.vsqz.x.v128f16(<128 x half> %value, <256 x i1> %pred, i32 1)
  %a0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %a1 = call <32 x i8> @llvm.hivm.vstus(<128 x half> %value, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 66, <32 x i8> %a0)
  call void @llvm.hivm.vstas(<32 x i8> %a1, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 66, i32 0)
  %b0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %b1 = call <32 x i8> @llvm.hivm.vstur(<128 x half> %packed, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), <32 x i8> %b0, i32 1, i32 0)
  call void @llvm.hivm.vstar(<32 x i8> %b1, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define dso_local ptc_kernel void @dav_stateful_store_bf16(ptr addrspace(1) %data,
                                                          ptr addrspace(1) %seed_vstus,
                                                          ptr addrspace(1) %seed_vstur,
                                                          ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %data, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %seed_vstus, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), ptr addrspace(1) %seed_vstur, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.sprclr(i16 74)
  %value = call <128 x i16> @llvm.hivm.vldsx1.v128s16(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %plt = call { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32 35)
  %pred = extractvalue { <256 x i1>, i32 } %plt, 0
  %packed = call <128 x i16> @llvm.hivm.vsqz.x.v128i16(<128 x i16> %value, <256 x i1> %pred, i32 1)
  %a0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %a1 = call <32 x i8> @llvm.hivm.vstus(<128 x i16> %value, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 70, <32 x i8> %a0)
  call void @llvm.hivm.vstas(<32 x i8> %a1, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 70, i32 0)
  %b0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %b1 = call <32 x i8> @llvm.hivm.vstur(<128 x i16> %packed, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), <32 x i8> %b0, i32 1, i32 0)
  call void @llvm.hivm.vstar(<32 x i8> %b1, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define dso_local ptc_kernel void @dav_stateful_store_i16(ptr addrspace(1) %data,
                                                         ptr addrspace(1) %seed_vstus,
                                                         ptr addrspace(1) %seed_vstur,
                                                         ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %data, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %seed_vstus, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), ptr addrspace(1) %seed_vstur, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.sprclr(i16 74)
  %value = call <128 x i16> @llvm.hivm.vldsx1.v128s16(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %plt = call { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32 37)
  %pred = extractvalue { <256 x i1>, i32 } %plt, 0
  %packed = call <128 x i16> @llvm.hivm.vsqz.x.v128i16(<128 x i16> %value, <256 x i1> %pred, i32 1)
  %a0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %a1 = call <32 x i8> @llvm.hivm.vstus(<128 x i16> %value, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 74, <32 x i8> %a0)
  call void @llvm.hivm.vstas(<32 x i8> %a1, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 74, i32 0)
  %b0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %b1 = call <32 x i8> @llvm.hivm.vstur(<128 x i16> %packed, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), <32 x i8> %b0, i32 1, i32 0)
  call void @llvm.hivm.vstar(<32 x i8> %b1, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define dso_local ptc_kernel void @dav_stateful_store_i8(ptr addrspace(1) %data,
                                                        ptr addrspace(1) %seed_vstus,
                                                        ptr addrspace(1) %seed_vstur,
                                                        ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %data, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %seed_vstus, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), ptr addrspace(1) %seed_vstur, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.sprclr(i16 74)
  %value = call <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %plt = call { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32 65)
  %pred = extractvalue { <256 x i1>, i32 } %plt, 0
  %packed = call <256 x i8> @llvm.hivm.vsqz.x.v256i8(<256 x i8> %value, <256 x i1> %pred, i32 1)
  %a0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %a1 = call <32 x i8> @llvm.hivm.vstus(<256 x i8> %value, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 65, <32 x i8> %a0)
  call void @llvm.hivm.vstas(<32 x i8> %a1, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 65, i32 0)
  %b0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %b1 = call <32 x i8> @llvm.hivm.vstur(<256 x i8> %packed, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), <32 x i8> %b0, i32 1, i32 0)
  call void @llvm.hivm.vstar(<32 x i8> %b1, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <128 x half> @llvm.hivm.vldsx1.v128f16(ptr addrspace(6), i32, i32, i32)
declare <128 x i16> @llvm.hivm.vldsx1.v128s16(ptr addrspace(6), i32, i32, i32)
declare <256 x i8> @llvm.hivm.vldsx1.v256s8(ptr addrspace(6), i32, i32, i32)
declare { <256 x i1>, i32 } @llvm.hivm.plt.b8.v300(i32)
declare { <256 x i1>, i32 } @llvm.hivm.plt.b16.v300(i32)
declare <128 x half> @llvm.hivm.vsqz.x.v128f16(<128 x half>, <256 x i1>, i32)
declare <128 x i16> @llvm.hivm.vsqz.x.v128i16(<128 x i16>, <256 x i1>, i32)
declare <256 x i8> @llvm.hivm.vsqz.x.v256i8(<256 x i8>, <256 x i1>, i32)
declare <32 x i8> @llvm.hivm.init.vector.align.data()
declare <32 x i8> @llvm.hivm.vstus(<128 x half>, ptr addrspace(6), i32, <32 x i8>)
declare <32 x i8> @llvm.hivm.vstus(<128 x i16>, ptr addrspace(6), i32, <32 x i8>)
declare <32 x i8> @llvm.hivm.vstus(<256 x i8>, ptr addrspace(6), i32, <32 x i8>)
declare void @llvm.hivm.vstas(<32 x i8>, ptr addrspace(6), i32, i32)
declare <32 x i8> @llvm.hivm.vstur(<128 x half>, ptr addrspace(6), <32 x i8>, i32, i32)
declare <32 x i8> @llvm.hivm.vstur(<128 x i16>, ptr addrspace(6), <32 x i8>, i32, i32)
declare <32 x i8> @llvm.hivm.vstur(<256 x i8>, ptr addrspace(6), <32 x i8>, i32, i32)
declare void @llvm.hivm.vstar(<32 x i8>, ptr addrspace(6), i32)
declare void @llvm.hivm.sprclr(i16)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }
