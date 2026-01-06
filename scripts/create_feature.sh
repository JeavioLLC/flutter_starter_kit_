#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: ./scripts/create_feature.sh <feature_name>"
  exit 1
fi

FEATURE="$1"
BASE="lib/features/$FEATURE"

mkdir -p "$BASE"/{data/models,data/providers,data/repositories,domain/models,domain/use_cases,presentation/pages,presentation/viewmodels,presentation/widgets}

cat <<'EOT' > "$BASE"/README.md
# $FEATURE Feature

Describe the feature boundaries, data sources, routing, and presentation layer.
EOT

cat <<EOT > "$BASE"/data/repositories/${FEATURE}_repository.dart
import '../../../core/utils/result.dart';

abstract class ${FEATURE^}Repository {
  // Define repository contract here
}
EOT

echo "Feature scaffold created under $BASE"
