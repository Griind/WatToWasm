(module
(export "func_01_const" (func $func_01_const))
(export "func_02_params" (func $func_02_params))

  (func $func_01_const (result i32)
    (i32.const 42)
  )
  (func $func_02_params (param i32)(param i32)(result i32)
    (local.get 0)
    (local.get 1)
    i32.add
  )
)