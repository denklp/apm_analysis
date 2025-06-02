#!/bin/bash

DEFAULT=nodepool_default.yaml
WORKLOAD=nodepool_workload.yaml
OUTPUT=merged_nodepool.yaml

yq eval-all '
  # Load files
  select(fileIndex == 0) as $default |
  select(fileIndex == 1) as $workload |

  # Start with merged base
  ($default * $workload) as $merged
  |

  # Merge requirements with workload taking priority by key
  $merged
  | .temlplate.spec.requirements = (
      ($workload.temlplate.spec.requirements // [])
      + ($default.temlplate.spec.requirements // [])
      | unique_by(.key)
    )

  # Merge taints the same way
  | .temlplate.spec.taints = (
      ($workload.temlplate.spec.taints // [])
      + ($default.temlplate.spec.taints // [])
      | unique_by(.key)
    )
' "$DEFAULT" "$WORKLOAD" > "$OUTPUT"
