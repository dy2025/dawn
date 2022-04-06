#version 310 es

uvec2 tint_insert_bits(uvec2 v, uvec2 n, uint offset, uint count) {
  uint s = min(offset, 32u);
  uint e = min(32u, (s + count));
  return bitfieldInsert(v, n, int(s), int((e - s)));
}

void insertBits_3c7ba5() {
  uvec2 res = tint_insert_bits(uvec2(0u, 0u), uvec2(0u, 0u), 1u, 1u);
}

vec4 vertex_main() {
  insertBits_3c7ba5();
  return vec4(0.0f, 0.0f, 0.0f, 0.0f);
}

void main() {
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
#version 310 es
precision mediump float;

uvec2 tint_insert_bits(uvec2 v, uvec2 n, uint offset, uint count) {
  uint s = min(offset, 32u);
  uint e = min(32u, (s + count));
  return bitfieldInsert(v, n, int(s), int((e - s)));
}

void insertBits_3c7ba5() {
  uvec2 res = tint_insert_bits(uvec2(0u, 0u), uvec2(0u, 0u), 1u, 1u);
}

void fragment_main() {
  insertBits_3c7ba5();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

uvec2 tint_insert_bits(uvec2 v, uvec2 n, uint offset, uint count) {
  uint s = min(offset, 32u);
  uint e = min(32u, (s + count));
  return bitfieldInsert(v, n, int(s), int((e - s)));
}

void insertBits_3c7ba5() {
  uvec2 res = tint_insert_bits(uvec2(0u, 0u), uvec2(0u, 0u), 1u, 1u);
}

void compute_main() {
  insertBits_3c7ba5();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
