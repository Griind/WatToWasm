(module

  (export "f14_fibonacci_recursive" (func $f14_fibonacci_recursive))



  (func $f14_fibonacci_recursive (param $n i32) (result i32)
    (if (i32.eq (local.get $n) (i32.const 0))
      (then
        (return (i32.const 0))
      )
    )

    (if (i32.eq (local.get $n) (i32.const 1))
      (then
        (return (i32.const 1))
      )
    )

    (i32.add
      (call $f14_fibonacci_recursive
        (i32.sub (local.get $n) (i32.const 2))
      )
      (call $f14_fibonacci_recursive
        (i32.sub (local.get $n) (i32.const 1))
      )
    )
  )
)