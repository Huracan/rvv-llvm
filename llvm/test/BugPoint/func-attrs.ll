; RUN: bugpoint -load %llvmshlibdir/BugpointPasses%shlibext %s -output-prefix %t -bugpoint-crashfuncattr -silence-passes
; RUN: llvm-dis %t-reduced-simplified.bc -o - | FileCheck %s
; REQUIRES: plugins

; CHECK: f() #[[ATTRS:[0-9]+]]
define void @f() #0 {
  ret void
}

; CHECK: attributes #[[ATTRS]] = { "bugpoint-crash" }
attributes #0 = { noinline "bugpoint-crash" "no-frame-pointer-elim-non-leaf" }
