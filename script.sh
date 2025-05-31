yq eval-all '
  (
    reduce (.[0] + .[1])[] as $item (
      {};  # start with empty map
      .[$item.key] = $item
    )
  | to_entries | map(.value)
  )
' template.yaml nodepool_name.yaml


#!/bin/sh

TEMPLATE_FILE=${1:-template.yaml}
NODEPOOL_FILE=${2:-nodepool_name.yaml}

yq eval-all '
  (
    reduce (.[0] + .[1])[] as $item (
      {};  # start with empty map
      .[$item.key] = $item
    )
  | to_entries | map(.value)
  )
' "$TEMPLATE_FILE" "$NODEPOOL_FILE"