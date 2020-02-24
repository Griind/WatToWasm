(module
(export "func_0_const" (func $func_0_const))
(export "func_1_params" (func $func_1_params))
(export "func_2_named" (func $func_2_named))
(export "func_3_folded" (func $func_3_folded))
(export "func_4_nested" (func $func_4_nested))
(export "func_5_locals" (func $func_5_locals))



  (func $func_0_const (result i32)
     i32.const 42
  )

  (func $func_1_params (param i32)(param i32)(result i32)
     local.get 0
     local.get 1
     i32.add
  )

  (func $func_2_named (param $pname0 i32)(param $pname1 i32)(result i32)
    local.get $pname0
    local.get $pname1
    i32.add
  )

  (func $func_3_folded (param $pname0 i32)(param $pname1 i32)(result i32)
    (i32.add
       (local.get $pname0)
       (local.get $pname1)
    )
  )

  (func $func_4_nested (param $pname0 i32)(param $pname1 i32)(result i32)
    (i32.add
       (i32.add(local.get $pname0)(local.get $pname1))
       (i32.const 100)
    )
  )

  (func $func_5_locals (param $pname0 i32)(param $pname1 i32)(result i32)
      (local $x i32)
      (local.set $x 
        (i32.add
          (i32.add(local.get $pname0)(local.get $pname1))
          (i32.const 100)
        )
      )
      local.get $x
  )
)
