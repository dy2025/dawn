#version 310 es

layout(rgba8ui) uniform highp writeonly uimage2DArray arg_0;
void textureNumLayers_ff5e89() {
  int res = imageSize(arg_0).z;
}

vec4 vertex_main() {
  textureNumLayers_ff5e89();
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

layout(rgba8ui) uniform highp writeonly uimage2DArray arg_0;
void textureNumLayers_ff5e89() {
  int res = imageSize(arg_0).z;
}

void fragment_main() {
  textureNumLayers_ff5e89();
}

void main() {
  fragment_main();
  return;
}
#version 310 es

layout(rgba8ui) uniform highp writeonly uimage2DArray arg_0;
void textureNumLayers_ff5e89() {
  int res = imageSize(arg_0).z;
}

void compute_main() {
  textureNumLayers_ff5e89();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
