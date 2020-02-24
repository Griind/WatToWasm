const fs = require("fs");
const wabt = require("wabt")();

async function main() {
  const src = "main.wat";
  const wasm = wabt.parseWat(src, fs.readFileSync(src, "utf8"));
  const { buffer } = wasm.toBinary({});
  const { instance } = await WebAssembly.instantiate(buffer);
  const { exports: e } = instance;

  console.log("func_01's result:", e.func_01_const());
  console.log("func_02_params's result:", e.func_02_params(6,5));
}
console.clear();
main().catch(e => {
  console.error(e);
  process.exit(1);
});
