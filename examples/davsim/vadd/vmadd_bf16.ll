; Minimal dav bf16 vmadd LLVM IR smoke test for tools/asc-sim.
;
; This mirrors OpenTileAS simulator/cases/a5_vmadd_bf16: GM bf16 inputs are
; copied to UB with the lowered s8 DMA form, loaded into bf16 registers, passed
; through vmadd, stored back through UB, and copied to GM.

define dso_local ptc_kernel void @dav_vmadd_bf16(ptr addrspace(1) %dst,
                                                 ptr addrspace(1) %a,
                                                 ptr addrspace(1) %b,
                                                 ptr addrspace(1) %out) #0 {
entry:
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) null, ptr addrspace(1) %dst, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), ptr addrspace(1) %a, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.MOV.OUT.TO.UB.ALIGN.V2.s8.DV(ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), ptr addrspace(1) %b, i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.SET.FLAG.IMM(i64 4, i64 1, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 4, i64 1, i64 0)
  %mask = call <256 x i1> @llvm.hivm.pset.b16(i32 0)
  %vdst = call <128 x bfloat> @llvm.hivm.vldsx1.v128bf16(ptr addrspace(6) null, i32 0, i32 0, i32 0)
  %va = call <128 x bfloat> @llvm.hivm.vldsx1.v128bf16(ptr addrspace(6) inttoptr (i64 512 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %vb = call <128 x bfloat> @llvm.hivm.vldsx1.v128bf16(ptr addrspace(6) inttoptr (i64 1024 to ptr addrspace(6)), i32 0, i32 0, i32 0)
  %result = call <128 x bfloat> @llvm.hivm.vmadd.m.v128bf16(<128 x bfloat> %vdst, <128 x bfloat> %va, <128 x bfloat> %vb, <256 x i1> %mask)
  call void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat> %result, ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), i32 0, i32 2, i32 0, <256 x i1> %mask)
  call void @llvm.hivm.SET.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.WAIT.FLAG.IMM(i64 1, i64 5, i64 0)
  call void @llvm.hivm.MOV.UB.TO.OUT.ALIGN.V2.DV(ptr addrspace(1) %out, ptr addrspace(6) inttoptr (i64 1536 to ptr addrspace(6)), i64 288230377225453696, i64 35184372088864)
  call void @llvm.hivm.BARRIER(i64 6)
  ret void
}

declare <256 x i1> @llvm.hivm.pset.b16(i32)
declare <128 x bfloat> @llvm.hivm.vldsx1.v128bf16(ptr addrspace(6), i32, i32, i32)
declare <128 x bfloat> @llvm.hivm.vmadd.m.v128bf16(<128 x bfloat>, <128 x bfloat>, <128 x bfloat>, <256 x i1>)
declare void @llvm.hivm.vstsx1.v128bf16(<128 x bfloat>, ptr addrspace(6), i32, i32, i32, <256 x i1>)
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
!1 = !{ptr @dav_vmadd_bf16, !"kernel", i32 1}
