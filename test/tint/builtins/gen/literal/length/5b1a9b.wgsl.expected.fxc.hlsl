SKIP: FAILED

void length_5b1a9b() {
  float16_t res = length((float16_t(0.0h)).xxxx);
}

struct tint_symbol {
  float4 value : SV_Position;
};

float4 vertex_main_inner() {
  length_5b1a9b();
  return (0.0f).xxxx;
}

tint_symbol vertex_main() {
  const float4 inner_result = vertex_main_inner();
  tint_symbol wrapper_result = (tint_symbol)0;
  wrapper_result.value = inner_result;
  return wrapper_result;
}

void fragment_main() {
  length_5b1a9b();
  return;
}

[numthreads(1, 1, 1)]
void compute_main() {
  length_5b1a9b();
  return;
}
FXC validation failure:
D:\Projects\RampUp\dawn\test\tint\builtins\Shader@0x00000206B010D5C0(2,3-11): error X3000: unrecognized identifier 'float16_t'
D:\Projects\RampUp\dawn\test\tint\builtins\Shader@0x00000206B010D5C0(2,13-15): error X3000: unrecognized identifier 'res'
