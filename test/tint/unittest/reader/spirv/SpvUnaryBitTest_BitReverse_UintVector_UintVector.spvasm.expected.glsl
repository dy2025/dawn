#version 310 es

void main_1() {
  uint u1 = 10u;
  int i1 = 30;
  uvec2 v2u1 = uvec2(10u, 20u);
  ivec2 v2i1 = ivec2(30, 40);
  uvec2 x_1 = bitfieldReverse(v2u1);
  return;
}

void tint_symbol() {
  main_1();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  tint_symbol();
  return;
}