@group(1) @binding(0) var arg_0 : texture_1d<i32>;

fn textureLoad_62d1de() {
  var res : vec4<i32> = textureLoad(arg_0, 1i, 1u);
}

@vertex
fn vertex_main() -> @builtin(position) vec4<f32> {
  textureLoad_62d1de();
  return vec4<f32>();
}

@fragment
fn fragment_main() {
  textureLoad_62d1de();
}

@compute @workgroup_size(1)
fn compute_main() {
  textureLoad_62d1de();
}