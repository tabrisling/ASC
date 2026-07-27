# DAV-3510 Intrinsic Modeling Workplan

This document splits the DAV-3510 LLVM IR local simulation effort into
parallel workstreams. The goal is strict differential modeling against the
OpenTileAS simulator:

- If ASC accepts a kernel, the matching simulator case must pass.
- If the simulator cannot run a kernel or reports an execution/check failure,
  ASC must reject it locally through static or runtime validation.
- New behavior support must come with an oracle case and coverage accounting.

Current baseline:

- `45/1074` intrinsics are model-supported.
- `188` intrinsics have oracle evidence.
- Oracle states: `45 behavior`, `58 fail-closed`, `85 model-gap`.
- Priority distribution: `36 P0`, `240 P1`, `798 P2`.

## Milestones

M0: VADD and vector foundation

- Scope: GM -> UB -> register -> UB -> GM, f32 vector arithmetic, predicate
  storage, basic flag/barrier validation, memory overflow/alignment checks.
- Outcome: VADD-like kernels catch compile, address, mask, and runtime-shape
  issues locally before using the remote simulator.

M1: RMSNorm AIV path

- Scope: f32/f16 load-store, f16/f32 conversion, vector multiply/add, reduction,
  sqrt/div/dups, predicate and tail semantics.
- Outcome: small RMSNorm kernels run locally with numerical golden comparison.

M2: Single-tile Matmul/GEMM skeleton

- Scope: GM/L1/L0A/L0B/L0C spaces, L1/L0 load descriptors, MAD, FIX, and cube
  synchronization checks.
- Outcome: one small tile can be simulated, and malformed cube kernels are
  fail-closed before remote execution.

M3: Group GEMM and variable-shape GEMM

- Scope: group LUT, grid-stride offsets, split K/N, accumulation, tail writes,
  and multi-block metadata validation.
- Outcome: OpenTileAS group GEMM lowering has local structural and numerical
  coverage for representative shapes.

M4: CV and img2col path

- Scope: 3DV2 img2col typed loads, padding/stride/dilation descriptors, cube
  compute, FIX, and vector post-processing.
- Outcome: CV kernels are validated first at ABI/static level, then at behavior
  level for small known-pattern cases.

M5: Mixed AIC/AIV fused kernels

- Scope: AIC/AIV interaction, L1/UB exchange, intra-block synchronization,
  stateful loads/stores, and fused epilogues.
- Outcome: complex fused kernels can be checked locally for invalid dataflow,
  synchronization, and memory use before remote simulator or hardware runs.

## Parallel Workstreams

### A. Coverage and Oracle Gate

Owner focus: inventory, evidence, pass/fail policy.

Write scope:

- `tools/asc-sim/asc-intrinsic-coverage`
- `tools/asc-sim/asc-sim-oracle`
- `examples/davsim/vadd/oracle/vadd_oracle_suite.json`

Deliverables:

- Keep the OpenTileAS intrinsic inventory synchronized with ASC support.
- Add gates for `ASC pass + no simulator oracle` and
  `ASC pass + simulator error`.
- Maintain P0/P1/P2 classification and per-category progress.
- Record simulator evidence for every promoted behavior model.

First tasks:

- Normalize external A5 cases into behavior, fail-closed, and model-gap states.
- Fix known mismatches such as pass locally but simulator failing.
- Add reporting that prints the next unsupported P0/P1 intrinsics by category.

Validation:

```bash
build/bin/asc-sim-oracle --enforce-simulator-coverage --enforce-a5-external-coverage
build/bin/asc-intrinsic-coverage --fail-on-p0-missing-oracle
build/bin/asc-intrinsic-coverage --fail-on-supported-missing-oracle
```

### B. Memory, Descriptor, and Synchronization Model

Owner focus: DAV-3510 execution skeleton and rejection accuracy.

Write scope:

- `tools/asc-sim/asc-sim`
- memory/sync-focused oracle entries in `examples/davsim/vadd/oracle/vadd_oracle_suite.json`

Deliverables:

- Move from f32-list buffers toward byte-addressed memory spaces.
- Model GM, UB, L1, L0A, L0B, L0C, predicate bytes, and register values as
  separate spaces.
- Centralize region checks: address space, byte length, alignment, overflow,
  descriptor-derived access size, and active-mask write constraints.
- Strengthen synchronization: flag set/wait consume, pipe pairs, barrier
  accounting, `mem.bar`, and simple wait-before-set/deadlock detection.

First tasks:

- Complete predicate immediate support: `pset.b8`, `psti.b8`, `pldi.b8`,
  `psts.b8`, and `mem.bar.vv.all`.
- Add memory-negative oracle cases for unaligned access, wrong address space,
  descriptor zero length, and UB/GM overflow.
- Keep L1/L0 and stateful load/store unsupported until fail-closed evidence is
  explicit.

Validation:

```bash
build/bin/asc-sim-oracle --case-filter 'predicate|dma|overflow|flag|barrier' --enforce-simulator-coverage --enforce-a5-external-coverage
```

### C. Vector, Mask, and Special-Value Semantics

Owner focus: AIV numerical behavior for vadd-like operators.

Write scope:

- `tools/asc-sim/asc-sim`
- generated vector oracle cases under `examples/davsim/vadd/`
- vector entries in `examples/davsim/vadd/oracle/vadd_oracle_suite.json`

Deliverables:

- Shared `x/m/z` mask semantics for binary, scalar-vector, unary, and store
  operations.
- Undefined inactive-lane tracking that prevents ASC from passing kernels which
  later read or store undefined lanes.
- Simulator-calibrated f32 special-value behavior: `NaN`, `Inf`, signed zero,
  subnormal, overflow, domain errors, and divide-by-zero.

First tasks:

- Promote `vadd/vsub/vmul/vdiv/vmax/vmin.s.{m,z}.v64f32` when simulator
  confirms inactive-lane behavior.
- Add special-value matrices for existing f32 `x` mode operators.
- Keep `vmull` and uncalibrated reciprocal-like operators fail-closed.

Validation:

```bash
build/bin/asc-sim-oracle --case-filter 'vadd|vsub|vmul|vdiv|vmax|vmin|special|mask'
```

### D. Predicate, Select, Convert, and Reduction

Owner focus: operations needed by RMSNorm and branchless vector code.

Write scope:

- `tools/asc-sim/asc-sim`
- relevant oracle cases in `examples/davsim/vadd/`
- coverage support lists in `tools/asc-sim/asc-intrinsic-coverage`

Deliverables:

- Predicate byte/state behavior for `pset`, `plt`, `plds`, `psts`, `pldi`,
  `psti`, `pstu`, and compare-generated predicates.
- `vsel` semantics, including whether unselected sources are read.
- Reduction semantics for `vcadd`, `vcmax`, and `vcmin` under full and partial
  masks.
- Conversion semantics for f16/f32 and later bf16/int variants.

First tasks:

- Finish `a5_predicate_immediate` and `a5_predicate_widths` as behavior cases.
- Calibrate `vcmax.s.m.v64f32` and `vcmin.s.m.v64f32`, which are currently high
  risk for ASC-pass/simulator-error mismatch.
- Implement f16 load-store and f16/f32 conversion before RMSNorm.

Validation:

```bash
build/bin/asc-sim-oracle --case-filter 'predicate|vsel|vcadd|vcmax|vcmin|vcvt|f16'
```

### E. Matmul and GEMM Cube Model

Owner focus: AIC/cube path.

Write scope:

- new cube-memory helpers in `tools/asc-sim/asc-sim`
- new GEMM/matmul examples under `examples/davsim/`
- cube entries in the oracle suite

Deliverables:

- L1/L0A/L0B/L0C memory spaces and capacity checks.
- Descriptor decoders for `MOV.OUT.TO.L1`, `LOAD.L1.TO.L0A/B`, `MAD`, `MMAD`,
  and `FIX.L0C.TO.OUT`.
- Structural fail-closed checks before numerical support.
- Numerical behavior for one small f32/f16/bf16 tile, then group GEMM.

First tasks:

- Add static/fail-closed oracle coverage for cube intrinsics before modeling.
- Build one 64x64-style single-tile golden case from OpenTileAS lowering.
- Only promote to behavior pass after matching simulator evidence exists.

Validation:

```bash
build/bin/asc-sim-oracle --case-filter 'matmul|gemm|cube|l0|l1|fix|mad'
```

### F. CV, Gather/Scatter, Rearrange, and Stateful Operations

Owner focus: CV kernels and non-contiguous memory behavior.

Write scope:

- `tools/asc-sim/asc-sim`
- CV/gather/rearrange oracle examples under `examples/davsim/`
- external case expectations in the oracle suite

Deliverables:

- `vgatherb`, `vgather2`, `vsldb`, `vsqz`, `vusqz`, unpack/repack, and sort
  semantics where simulator evidence is available.
- Stateful load/store handling for `vldus`, `vldas`, `vstas`, `vstar`, `vstus`,
  and `vstur`.
- CV/img2col static ABI checks first, then behavior checks for small cases.

First tasks:

- Promote `a5_memory_blocks` and `a5_vgatherb_*` after byte memory is ready.
- Keep `a5_unaligned_load_state` fail-closed because the simulator reports an
  unsupported instruction/type on that path.
- Add img2col typed-load inventory and fail-closed evidence before behavior
  modeling.

Validation:

```bash
build/bin/asc-sim-oracle --case-filter 'gather|memory_blocks|sqz|stateful|img2col|cv'
```

## Execution Rules

- Workstreams may run in parallel only when their write scopes do not overlap.
- If two streams must edit `tools/asc-sim/asc-sim`, merge in this order:
  memory/sync first, vector second, predicate/reduction third, cube fourth,
  CV/gather fifth.
- A behavior model is not complete until coverage, oracle, and simulator
  evidence agree.
- A fail-closed case is valid only when the failure reason is intentional and
  documented in the oracle entry.
- Each completed patch must be committed separately.

## Immediate Dispatch

The next parallel batch should be:

1. Memory/sync: implement `a5_predicate_immediate` behavior support.
2. Coverage/oracle: tighten coverage gates and normalize external A5 states.
3. Vector/mask: design and add mask/special-value oracle matrices.
4. RMSNorm prerequisites: f16 load-store plus f16/f32 conversion plan.
5. Cube/GEMM: static fail-closed inventory for L1/L0/MAD/FIX.
6. CV/gather: promote memory block/gather cases only after byte memory lands.

