# Twelve

Repo for repoducing an issue with runtime symbols with elixir 1.12.0, otp 24.0 and alpine 3.13.3


## To reproduce issue

``` bash
$ docker build . -t twelve
$ docker run twelve
```

You should then see

``` bash
Error loading shared library libstdc++.so.6: No such file or directory (needed by /app/erts-12.0/bin/beam.smp)
Error loading shared library libgcc_s.so.1: No such file or directory (needed by /app/erts-12.0/bin/beam.smp)
Error relocating /app/erts-12.0/bin/beam.smp: __cxa_begin_catch: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZSt24__throw_out_of_range_fmtPKcz: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _Znwm: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZSt20__throw_length_errorPKc: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: __cxa_guard_release: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZNKSt8__detail20_Prime_rehash_policy11_M_next_bktEm: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: __popcountdi2: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZSt17__throw_bad_allocv: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm: symbol not found
Error relocating /app/erts-12.0/bin/beam.smp: _ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base: symbol not found
...
```

