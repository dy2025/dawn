// Copyright 2020 The Tint Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "src/tint/writer/spirv/spv_dump.h"
#include "src/tint/writer/spirv/test_helper.h"

namespace tint {
namespace writer {
namespace spirv {
namespace {

using BuilderTest = TestHelper;

TEST_F(BuilderTest, Bitcast) {
  auto* bitcast = create<ast::BitcastExpression>(ty.u32(), Expr(2.4f));

  WrapInFunction(bitcast);

  spirv::Builder& b = Build();

  b.push_function(Function{});
  EXPECT_EQ(b.GenerateBitcastExpression(bitcast), 1u);

  EXPECT_EQ(DumpInstructions(b.types()), R"(%2 = OpTypeInt 32 0
%3 = OpTypeFloat 32
%4 = OpConstant %3 2.4000001
)");
  EXPECT_EQ(DumpInstructions(b.functions()[0].instructions()),
            R"(%1 = OpBitcast %2 %4
)");
}

TEST_F(BuilderTest, Bitcast_DuplicateType) {
  auto* bitcast = create<ast::BitcastExpression>(ty.f32(), Expr(2.4f));

  WrapInFunction(bitcast);

  spirv::Builder& b = Build();

  b.push_function(Function{});
  EXPECT_EQ(b.GenerateBitcastExpression(bitcast), 1u);

  EXPECT_EQ(DumpInstructions(b.types()), R"(%2 = OpTypeFloat 32
%3 = OpConstant %2 2.4000001
)");
  EXPECT_EQ(DumpInstructions(b.functions()[0].instructions()),
            R"(%1 = OpCopyObject %2 %3
)");
}

}  // namespace
}  // namespace spirv
}  // namespace writer
}  // namespace tint
