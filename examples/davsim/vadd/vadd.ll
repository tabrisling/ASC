; Minimal dav vadd LLVM IR smoke test for tools/asc-sim.
;
; This mirrors the real dav kernel shape used by OpenTileAS outputs:
; GM kernel arguments -> GM to UB DMA -> vector register math -> UB to GM DMA.

define void @dav_vadd(ptr addrspace(1) %a,
                      ptr addrspace(1) %b,
                      ptr addrspace(1) %out) {
entry:
  %ctrl0 = call i64 @llvm.hivm.GET.CTRL()
  %ctrl1 = call i64 @llvm.hivm.SBITSET0(i64 %ctrl0, i64 6)
  %ctrl2 = call i64 @llvm.hivm.SBITSET0(i64 %ctrl1, i64 7)
  %ctrl3 = call i64 @llvm.hivm.SBITSET0(i64 %ctrl2, i64 8)
  call void @llvm.hivm.SET.CTRL(i64 %ctrl3)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) null, ptr addrspace(1) %a, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), ptr addrspace(1) %b, i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 1)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 1)
  %mask = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %va = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %vb = call <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6) inttoptr (i64 256 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %sum = call <64 x float> @llvm.hivm.vadd.v64f32.x(<64 x float> %va, <64 x float> %vb, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %sum, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i64 8589935616, i64 281474976710912)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x float> @llvm.hivm.vldsx1.v64f32(ptr addrspace(6), i32, i32, i32)
declare <64 x float> @llvm.hivm.vadd.v64f32.x(<64 x float>, <64 x float>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare i64 @llvm.hivm.GET.CTRL()
declare i64 @llvm.hivm.SBITSET0(i64, i64)
declare void @llvm.hivm.SET.CTRL(i64)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.f32.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)
