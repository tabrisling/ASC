; Minimal dav vgather2 dtype matrix LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_vgather2_matrix: GM byte payloads
; are copied to UB, u16/u32 indices are loaded through vldsx1.s32, vgather2
; exercises B8->B16, B16, and B32 variants, and the result is copied back as a
; contiguous 2304B byte payload.

define dso_local ptc_kernel void @dav_vgather2_matrix(ptr addrspace(1) %data,
                                                      ptr addrspace(1) %indices16,
                                                      ptr addrspace(1) %indices32,
                                                      ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %data, i64 288230377225454080, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), ptr addrspace(1) %indices16, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), ptr addrspace(1) %indices32, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %mask8 = call <256 x i1> @llvm.hivm.pset.b8(i32 0)
  %mask16 = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %mask32 = call <256 x i1> @llvm.hivm.pset.b32(i32 0)
  %idx16 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %idx32 = call <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %gather_i8 = call <128 x i16> @llvm.hivm.vgather2.v300.v256s8(ptr addrspace(6) null, <64 x i32> %idx16, <256 x i1> %mask8)
  %gather_u8 = call <128 x i16> @llvm.hivm.vgather2.v300.v256u8(ptr addrspace(6) null, <64 x i32> %idx16, <256 x i1> %mask8)
  %gather_i16 = call <128 x i16> @llvm.hivm.vgather2.v300.v128s16(ptr addrspace(6) null, <64 x i32> %idx16, <256 x i1> %mask16)
  %gather_u16 = call <128 x i16> @llvm.hivm.vgather2.v300.v128u16(ptr addrspace(6) null, <64 x i32> %idx16, <256 x i1> %mask16)
  %gather_f16 = call <128 x half> @llvm.hivm.vgather2.v300.v128f16(ptr addrspace(6) null, <64 x i32> %idx16, <256 x i1> %mask16)
  %gather_bf16 = call <128 x bfloat> @llvm.hivm.vgather2.v300.v128bf16(ptr addrspace(6) null, <64 x i32> %idx16, <256 x i1> %mask16)
  %gather_i32 = call <64 x i32> @llvm.hivm.vgather2.v300.v64s32(ptr addrspace(6) null, <64 x i32> %idx32, <256 x i1> %mask32)
  %gather_u32 = call <64 x i32> @llvm.hivm.vgather2.v300.v64u32(ptr addrspace(6) null, <64 x i32> %idx32, <256 x i1> %mask32)
  %gather_f32 = call <64 x float> @llvm.hivm.vgather2.v300.v64f32(ptr addrspace(6) null, <64 x i32> %idx32, <256 x i1> %mask32)
  call void @llvm.hivm.vstsx1.v128s16(<128 x i16> %gather_i8, ptr addrspace(6) inttoptr (i64 2048 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vstsx1.v128s16(<128 x i16> %gather_u8, ptr addrspace(6) inttoptr (i64 2304 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vstsx1.v128s16(<128 x i16> %gather_i16, ptr addrspace(6) inttoptr (i64 2560 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vstsx1.v128s16(<128 x i16> %gather_u16, ptr addrspace(6) inttoptr (i64 2816 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vstsx1.v128f16(<128 x half> %gather_f16, ptr addrspace(6) inttoptr (i64 3072 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %gather_bf16, ptr addrspace(6) inttoptr (i64 3328 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask16)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %gather_i32, ptr addrspace(6) inttoptr (i64 3584 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask32)
  call void @llvm.hivm.vstsx1.v64s32(<64 x i32> %gather_u32, ptr addrspace(6) inttoptr (i64 3840 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask32)
  call void @llvm.hivm.vstsx1.v64f32(<64 x float> %gather_f32, ptr addrspace(6) inttoptr (i64 4096 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask32)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 2048 to ptr addrspace(6)), i64 288230377225454720, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b8(i32)
declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <256 x i1> @llvm.hivm.pset.b32(i32)
declare <64 x i32> @llvm.hivm.vldsx1.v64s32(ptr addrspace(6), i32, i32, i32)
declare <128 x i16> @llvm.hivm.vgather2.v300.v256s8(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vgather2.v300.v256u8(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vgather2.v300.v128s16(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x i16> @llvm.hivm.vgather2.v300.v128u16(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x half> @llvm.hivm.vgather2.v300.v128f16(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <128 x bfloat> @llvm.hivm.vgather2.v300.v128bf16(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vgather2.v300.v64s32(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <64 x i32> @llvm.hivm.vgather2.v300.v64u32(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare <64 x float> @llvm.hivm.vgather2.v300.v64f32(ptr addrspace(6), <64 x i32>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v128s16(<128 x i16>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.vstsx1.v128f16(<128 x half>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64s32(<64 x i32>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.vstsx1.v64f32(<64 x float>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
declare void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6), ptr addrspace(1), i64, i64)
declare void @llvm.hivm.SET.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.WAIT.FLAG.IMM(i64, i64, i64)
declare void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1), ptr addrspace(6), i64, i64)
declare void @llvm.hivm.BARRIER(i64)

attributes #0 = { "target-cpu"="dav-c310-vec" }
