# Proof of CAN(3,40,3) ≤ 86

The proof is a finite witness argument. It verifies a particular array, rather than
proving that a search procedure must succeed.

## Mathematical statement

Let `A` be the matrix in [CA_86_3_40_3.txt](CA_86_3_40_3.txt), whose rows and columns
are indexed from zero. For every `0 ≤ i < j < l < 40` and every
`(a,b,c) ∈ {0,1,2}³`, a row `r < 86` satisfies

```math
(A_{r,i},A_{r,j},A_{r,l})=(a,b,c).
```

There are 9,880 choices of `(i,j,l)` and 27 assignments, hence 266,760 requirements.
Supplying a row for each requirement proves coverage. Existence of this matrix then
implies that the minimum feasible row count is at most 86.

## Encoding the original matrix

[CA86/Certificate.lean](CA86/Certificate.lean) defines the type
`certificate : Fin 86 → Fin 40 → Fin 3`. Its natural-number numeral stores entry
`(r,c)` in the two-bit field at offset `2*(40*r+c)`. A shift and mask recover the
field. The final `% 3` constructs a bounded `Fin 3` value; all actual stored fields
already lie in `{0,1,2}`, so it changes none of them.

[scripts/generate.py](scripts/generate.py) checks the matrix's exact SHA-256,
dimensions, symbols, and the round trip of every field. Its `--check` mode regenerates
the source text in memory and compares it without replacing the existing proof files.
The file identity check connects the human-readable artifact to the Lean numeral;
the generator's own coverage calculation is not a premise of a Lean theorem.

## Witness data and soundness

For fixed first and second columns `i < j < 39`, each later column has 27 proposed row
indices. The witnesses use seven-bit fields, since all row indices are below 86.
The assignment index is `9*a + 3*b + c`.

[CA86/Checker.lean](CA86/Checker.lean) defines `checkPair`, which checks the actual
matrix entries for every proposed row. Default array access and reduction modulo 86
make malformed witness data well typed; the three entry equalities must still succeed.
Neither operation can make a non-covering matrix pass.

`checkPair_sound` proves that a successful Boolean check implies
`PairCovered A i j`: for every later column and every ternary assignment, a matching
row exists. The proof takes success through each finite `List.all`, extracts the
actual witness row, and converts Boolean equality to propositional equality.

## Exhaustive kernel checks

The 40 modules under [CA86/Blocks/](CA86/Blocks) contain 741 nonvacuous pair checks:
there are `choose(39,2)` possibilities for `i < j < 39`. Each check is proved with
`by decide +kernel`. This is kernel reduction, rather than native compilation of the
coverage test. Every valid third column and all 27 assignments are checked.

Finite decomposition using `Fin.forall_fin_succ` assembles each first-column block.
Impossible index cases are discharged logically. In particular, when `j = 39` no
later column exists, so no coverage computation is needed for that pair.

[CA86.lean](CA86.lean) assembles the blocks into `all_blocks` and immediately obtains
`ca86_covering : IsCoveringArray certificate`.

## The numerical covering-array number

[CA86/Basic.lean](CA86/Basic.lean) defines `Feasible n k v` as the existence of a
covering array of the given dimensions. A well-ordering argument proves that any
nonempty set of feasible natural row counts has a least element. `CAN₃ k v` chooses
that element, with a fallback of zero only when no feasible count exists.

The explicit 86-row witness makes the feasible set nonempty. `CAN_3_40_3_spec` proves
that `CAN₃ 40 3` is itself feasible and is at most every other feasible count. Thus
`CAN_3_40_3_le_86` has the usual minimum-row-count meaning.

## Foundations and checks

The covering theorem uses `propext` and `Quot.sound`. The minimum definition and
numerical bound additionally use `Classical.choice`. These are the complete reported
axiom sets; the audit enforces them exactly.

The deliberately false proof in [tests/NegativeMustFail.lean](tests/NegativeMustFail.lean)
must be rejected. [CA86/Negative.lean](CA86/Negative.lean) proves that an all-zero
control fails both the mathematical property and the same Boolean checker.
An independent [text-matrix verifier](crosscheck/README.md) supplies a separate
computational check, and `leanchecker --fresh CA86` replays all declarations in the
main theorem's import closure in a fresh kernel environment.
