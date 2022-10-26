@group(1) @binding(1) var arg_1 : texture_2d<f32>;

@group(1) @binding(2) var arg_2 : sampler;

fn textureGather_d8e958() {
  var res : vec4<f32> = textureGather(1u, arg_1, arg_2, vec2<f32>());
}

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureGather_d8e958();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureGather_d8e958();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureGather_d8e958();
}