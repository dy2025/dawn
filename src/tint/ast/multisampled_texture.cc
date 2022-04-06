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

#include "src/tint/ast/multisampled_texture.h"

#include "src/tint/program_builder.h"

TINT_INSTANTIATE_TYPEINFO(tint::ast::MultisampledTexture);

namespace tint {
namespace ast {

MultisampledTexture::MultisampledTexture(ProgramID pid,
                                         const Source& src,
                                         TextureDimension d,
                                         const Type* ty)
    : Base(pid, src, d), type(ty) {
  TINT_ASSERT(AST, type);
}

MultisampledTexture::MultisampledTexture(MultisampledTexture&&) = default;

MultisampledTexture::~MultisampledTexture() = default;

std::string MultisampledTexture::FriendlyName(
    const SymbolTable& symbols) const {
  std::ostringstream out;
  out << "texture_multisampled_" << dim << "<" << type->FriendlyName(symbols)
      << ">";
  return out.str();
}

const MultisampledTexture* MultisampledTexture::Clone(CloneContext* ctx) const {
  // Clone arguments outside of create() call to have deterministic ordering
  auto src = ctx->Clone(source);
  auto* ty = ctx->Clone(type);
  return ctx->dst->create<MultisampledTexture>(src, dim, ty);
}

}  // namespace ast
}  // namespace tint
