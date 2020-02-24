const fs = require('fs');
const wabt = require('wabt')();

async function main() {
  const src = '2.wat';
  const wasm = wabt.parseWat(src, fs.readFileSync(src, 'utf8'));
  const {buffer} = wasm.toBinary({});
  const {instance} = await WebAssembly.instantiate(buffer);
  const {exports: e} = instance;


  console.log('f14_fibonacci_recursive',
    Array.from({length: 16}, (_, i) => e.f14_fibonacci_recursive(i)));
}

main().catch(e => {
  console.error(e);
  process.exit(1);
});