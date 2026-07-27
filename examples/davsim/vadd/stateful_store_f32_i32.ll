; Minimal dav stateful-store LLVM IR smoke tests for tools/asc-sim.
;
; These mirror OpenTileAS a5_stateful_store_f32/i32: data and seed buffers are
; copied as GM bytes into UB, a prefix of the source vector is stored through
; both vstus/vstas and vsqz/vstur/vstar paths, then the two 256B seed regions
; are copied back as one 512B byte payload.

define dso_local ptc_kernel void @dav_stateful_store_f32(ptr addrspace(1) %data,
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
  %value = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %plt = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 17)
  %pred = extractvalue { <256 x i1>, i32 } %plt, 0
  %packed = call <64 x float> @llvm.hivm.vsqz.x.v64f32(<64 x float> %value, <256 x i1> %pred, i32 1)
  %a0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %a1 = call <32 x i8> @llvm.hivm.vstus(<64 x float> %value, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 68, <32 x i8> %a0)
  call void @llvm.hivm.vstas(<32 x i8> %a1, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 68, i32 0)
  %b0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %b1 = call <32 x i8> @llvm.hivm.vstur(<64 x float> %packed, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), <32 x i8> %b0, i32 1, i32 0)
  call void @llvm.hivm.vstar(<32 x i8> %b1, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

define dso_local ptc_kernel void @dav_stateful_store_i32(ptr addrspace(1) %data,
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
  %value = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %plt = call { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32 19)
  %pred = extractvalue { <256 x i1>, i32 } %plt, 0
  %packed = call <64 x i32> @llvm.hivm.vsqz.x.v64i32(<64 x i32> %value, <256 x i1> %pred, i32 1)
  %a0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %a1 = call <32 x i8> @llvm.hivm.vstus(<64 x i32> %value, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 76, <32 x i8> %a0)
  call void @llvm.hivm.vstas(<32 x i8> %a1, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 76, i32 0)
  %b0 = call <32 x i8> @llvm.hivm.init.vector.align.data()
  %b1 = call <32 x i8> @llvm.hivm.vstur(<64 x i32> %packed, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), <32 x i8> %b0, i32 1, i32 0)
  call void @llvm.hivm.vstar(<32 x i8> %b1, ptr addrspace(6) inttoptr (i64 768 to ptr addrspace(6)), i32 0)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 288230377225453824, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6), i32, i32, i32)
declare <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6), i32, i32, i32)
declare { <256 x i1>, i32 } @llvm.hivm.plt.b32.v300(i32)
declare <64 x float> @llvm.hivm.vsqz.x.v64f32(<64 x float>, <256 x i1>, i32)
declare <64 x i32> @llvm.hivm.vsqz.x.v64i32(<64 x i32>, <256 x i1>, i32)
declare <32 x i8> @llvm.hivm.init.vector.align.data()
declare <32 x i8> @llvm.hivm.vstus(<64 x float>, ptr addrspace(6), i32, <32 x i8>)
declare <32 x i8> @llvm.hivm.vstus(<64 x i32>, ptr addrspace(6), i32, <32 x i8>)
declare void @llvm.hivm.vstas(<32 x i8>, ptr addrspace(6), i32, i32)
declare <32 x i8> @llvm.hivm.vstur(<64 x float>, ptr addrspace(6), <32 x i8>, i32, i32)
declare <32 x i8> @llvm.hivm.vstur(<64 x i32>, ptr addrspace(6), <32 x i8>, i32, i32)
declare void @llvm.hivm.vstar(<32 x i8>, ptr addrspace(6), i32)
declare void @llvm.hivm.sprclr(i16)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }
