SKIP: FAILED

#version 310 es

uniform highp usamplerCubeArray arg_1_arg_2;

void textureGather_be276f() {
  vec3 arg_3 = vec3(0.0f);
  uint arg_4 = 1u;
  uvec4 res = textureGather(arg_1_arg_2, vec4(arg_3, float(arg_4)), int(1u));
}

vec4 vertex_main() {
  textureGather_be276f();
  return vec4(0.0f);
}

void main() {
  gl_PointSize = 1.0;
  vec4 inner_result = vertex_main();
  gl_Position = inner_result;
  gl_Position.y = -(gl_Position.y);
  gl_Position.z = ((2.0f * gl_Position.z) - gl_Position.w);
  return;
}
Error parsing GLSL shader:
ERROR: 0:3: 'usamplerCubeArray' : Reserved word. 
ERROR: 0:3: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.



#version 310 es
precision mediump float;

uniform highp usamplerCubeArray arg_1_arg_2;

void textureGather_be276f() {
  vec3 arg_3 = vec3(0.0f);
  uint arg_4 = 1u;
  uvec4 res = textureGather(arg_1_arg_2, vec4(arg_3, float(arg_4)), int(1u));
}

void fragment_main() {
  textureGather_be276f();
}

void main() {
  fragment_main();
  return;
}
Error parsing GLSL shader:
ERROR: 0:4: 'usamplerCubeArray' : Reserved word. 
ERROR: 0:4: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.



#version 310 es

uniform highp usamplerCubeArray arg_1_arg_2;

void textureGather_be276f() {
  vec3 arg_3 = vec3(0.0f);
  uint arg_4 = 1u;
  uvec4 res = textureGather(arg_1_arg_2, vec4(arg_3, float(arg_4)), int(1u));
}

void compute_main() {
  textureGather_be276f();
}

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;
void main() {
  compute_main();
  return;
}
Error parsing GLSL shader:
ERROR: 0:3: 'usamplerCubeArray' : Reserved word. 
ERROR: 0:3: '' : compilation terminated 
ERROR: 2 compilation errors.  No code generated.


