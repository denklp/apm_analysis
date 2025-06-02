#!/bin/bash

TEMPLATE_FILE=${1:-template.yaml}
NODEPOOL_FILE=${2:-nodepool_name.yaml}
OUTPUT_FILE=${3:-out/merged.yaml}

mkdir -p "$(dirname "$OUTPUT_FILE")"

yq eval-all '
  # Create a custom merge for "requirements"
  def merge_requirements(a; b):
    reduce (a + b)[] as $item (
      {}; .[$item.key] = $item
    ) | to_entries | map(.value);

  # Main logic
  (
    .[0] as $base |
    .[1] as $override |

    $base * $override |
    .requirements = merge_requirements($base.requirements; $override.requirements)
  )
' "$TEMPLATE_FILE" "$NODEPOOL_FILE" > "$OUTPUT_FILE"
