#version 310 es

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void unused_entry_point() {
  return;
}
void foo() {
  int a = 0;
  vec4 b = vec4(0.0f, 0.0f, 0.0f, 0.0f);
  mat2 c = mat2(0.0f, 0.0f, 0.0f, 0.0f);
  a = (a / 2);
  b = (b * mat4(0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f));
  c = (c * 2.0f);
}

