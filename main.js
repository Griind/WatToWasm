const fs = require("fs");
const wabt = require("wabt")();

async function main() {
  const src = "main.wat";
  const wasm = wabt.parseWat(src, fs.readFileSync(src, "utf8"));
  const { buffer } = wasm.toBinary({});
  const { instance } = await WebAssembly.instantiate(buffer);
  const { exports: e } = instance;

  console.log("func_0's result:", e.func_0_const());
  console.log("func_1_params's result:", e.func_1_params(6, 5));
  console.log("func_2_named's result:", e.func_2_named(6, 5));
  console.log("func_3_folded's result:", e.func_3_folded(6, 5));
  console.log("func_4_nested's result:", e.func_4_nested(6, 5));
  console.log("func_5_locals's result:", e.func_5_locals(6, 5));

}
console.clear();
main().catch(e => {
  console.error(e);
  process.exit(1);
});
