override o : i32 = i32();

@stage(compute) @workgroup_size(1)
fn main() {
  _ = o;
}
