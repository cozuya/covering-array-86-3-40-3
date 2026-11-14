import CA86.Negative

-- This file MUST fail: an invalid matrix cannot pass the same checker.
example : CA86.checkPair CA86.zeroArray 0 1 #[] = true := by
  decide +kernel
