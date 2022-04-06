// Copyright 2021 The Tint Authors.
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

#ifndef SRC_TINT_TRANSFORM_BINDING_REMAPPER_H_
#define SRC_TINT_TRANSFORM_BINDING_REMAPPER_H_

#include <unordered_map>

#include "src/tint/ast/access.h"
#include "src/tint/sem/binding_point.h"
#include "src/tint/transform/transform.h"

namespace tint {
namespace transform {

/// BindingPoint is an alias to sem::BindingPoint
using BindingPoint = sem::BindingPoint;

/// BindingRemapper is a transform used to remap resource binding points and
/// access controls.
class BindingRemapper final : public Castable<BindingRemapper, Transform> {
 public:
  /// BindingPoints is a map of old binding point to new binding point
  using BindingPoints = std::unordered_map<BindingPoint, BindingPoint>;

  /// AccessControls is a map of old binding point to new access control
  using AccessControls = std::unordered_map<BindingPoint, ast::Access>;

  /// Remappings is consumed by the BindingRemapper transform.
  /// Data holds information about shader usage and constant buffer offsets.
  struct Remappings final : public Castable<Data, transform::Data> {
    /// Constructor
    /// @param bp a map of new binding points
    /// @param ac a map of new access controls
    /// @param may_collide If true, then validation will be disabled for
    /// binding point collisions generated by this transform
    Remappings(BindingPoints bp, AccessControls ac, bool may_collide = true);

    /// Copy constructor
    Remappings(const Remappings&);

    /// Destructor
    ~Remappings() override;

    /// A map of old binding point to new binding point
    const BindingPoints binding_points;

    /// A map of old binding point to new access controls
    const AccessControls access_controls;

    /// If true, then validation will be disabled for binding point collisions
    /// generated by this transform
    const bool allow_collisions;
  };

  /// Constructor
  BindingRemapper();
  ~BindingRemapper() override;

  /// @param program the program to inspect
  /// @param data optional extra transform-specific input data
  /// @returns true if this transform should be run for the given program
  bool ShouldRun(const Program* program,
                 const DataMap& data = {}) const override;

 protected:
  /// Runs the transform using the CloneContext built for transforming a
  /// program. Run() is responsible for calling Clone() on the CloneContext.
  /// @param ctx the CloneContext primed with the input program and
  /// ProgramBuilder
  /// @param inputs optional extra transform-specific input data
  /// @param outputs optional extra transform-specific output data
  void Run(CloneContext& ctx,
           const DataMap& inputs,
           DataMap& outputs) const override;
};

}  // namespace transform
}  // namespace tint

#endif  // SRC_TINT_TRANSFORM_BINDING_REMAPPER_H_
