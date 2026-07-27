# ASC dav-sim vadd smoke test

This directory contains the first local dav intrinsic simulation milestone.
It exercises a single UB-resident `vector<64xf32>` add:

```text
pset -> vldsx1(a) -> vldsx1(b) -> vadd -> vstsx1(out)
```

Run it from the repository root:

```bash
build/bin/asc-sim examples/davsim/vadd/vadd.ll \
  --case examples/davsim/vadd/vadd.case.json \
  --trace
```

The model is intentionally functional. It checks the hardware constraints that
matter for the first step, including UB address space, 32-byte alignment, and
buffer overflow, but it does not model cycle timing or pipeline scheduling.
