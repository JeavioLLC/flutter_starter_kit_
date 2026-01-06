#!/usr/bin/env bash
# SAFE flutter_rename_all.sh
# Safe, robust rename script with --dry-run and centralized backups.
# Adds: --dry-run, rename_backups/, portable sed, and MainActivity package directory move.
#
# Usage examples:
#   Name-only (no ID change): ./flutter_rename_all.sh "Old Name" "New Name" [--dry-run]
#   ID + name:                ./flutter_rename_all.sh com.old.app com.new.app "Old Name" "New Name" [--dry-run]
#   ID only:                  ./flutter_rename_all.sh com.old.app com.new.app [--dry-run]

set -euo pipefail
IFS=$'\n\t'

# -----------------------
# Configurable targets
# -----------------------
TARGET_DIRS=(
  "android/app/src"
  "android/app/build.gradle"
  "android/app/build.gradle.kts"
  "android"
  "ios/Runner"
  "ios/Runner.xcodeproj"
  "ios/Runner.xcworkspace"
  "macos"
  "linux"
  "windows"
  "web"
  "lib"
  "test"
)

# Exclusions used for grep to avoid touching binary/generated files
EXCLUDES=(
  "--exclude-dir=build"
  "--exclude-dir=Pods"
  "--exclude-dir=Flutter"
  "--exclude-dir=.gradle"
  "--exclude-dir=node_modules"
  "--exclude-dir=.dart_tool"
)

# -----------------------
# Flags / backup dir
# -----------------------
DRY_RUN=false
BACKUP_DIR="rename_backups"
mkdir -p "$BACKUP_DIR"

# Parse "--dry-run" anywhere in args and remove it from "$@"
args=()
for a in "$@"; do
  if [[ "$a" == "--dry-run" ]]; then
    DRY_RUN=true
  else
    args+=("$a")
  fi
done
set -- "${args[@]}"

# -----------------------
# Helpers
# -----------------------
looks_like_id() {
  # crude heuristic: contains at least one dot and no spaces
  [[ "$1" == *.* && "$1" != *" "* ]]
}

backup_file() {
  local file="$1"
  [[ -f "$file" ]] || return 0
  local safe="${file//\//__}"
  cp -n "$file" "$BACKUP_DIR/$safe.bak" 2>/dev/null || true
}

grep_safe() {
  # usage: grep_safe <pattern> <path>
  local pattern="$1"; shift
  local path="$1"; shift
  local excl=("${EXCLUDES[@]}")
  # Use grep -RIl with exclusions; swallow errors
  grep -RIl "$pattern" "$path" "${excl[@]}" 2>/dev/null || true
}

# portable sed wrapper to avoid creating -E backup files on macOS/BSD
portable_sed_inplace() {
  local expr="$1"
  local file="$2"
  if sed --version >/dev/null 2>&1; then
    # GNU sed
    sed -E -i "${expr}" "$file"
  else
    # BSD/macOS sed
    sed -E -i '' "${expr}" "$file"
  fi
}

# perform textual replacements in a file (safe; portable)
replace_in_file() {
  local file="$1"
  local old="$2"
  local new="$3"

  [[ -f "$file" ]] || return 0

  if [[ "$DRY_RUN" == "true" ]]; then
    printf "DRY-RUN: would modify: %s (replace '%s' -> '%s')\n" "$file" "$old" "$new"
    return 0
  fi

  backup_file "$file"

  # escape '|' delimiter in variables (simple)
  local old_esc=${old//|/\\|}
  local new_esc=${new//|/\\|}

  # build sed expression using | delimiter
  local sed_expr="s|${old_esc}|${new_esc}|g"

  # execute portable sed
  portable_sed_inplace "$sed_expr" "$file" 2>/dev/null || true
}

# -----------------------
# Argument parsing
# -----------------------
OLD_ID=""
NEW_ID=""
OLD_NAME=""
NEW_NAME=""
NAME_ONLY=false

if [[ $# -eq 2 ]] && ! looks_like_id "$1" && ! looks_like_id "$2"; then
  NAME_ONLY=true
  OLD_NAME="$1"
  NEW_NAME="$2"
elif [[ $# -eq 1 ]]; then
  echo "Usage: $0 OLD_ID NEW_ID [OLD_NAME NEW_NAME]  OR  $0 \"Old Name\" \"New Name\""
  exit 1
elif [[ $# -ge 2 ]]; then
  if looks_like_id "$1" && looks_like_id "$2"; then
    OLD_ID="$1"
    NEW_ID="$2"
    if [[ $# -ge 4 ]]; then
      OLD_NAME="$3"
      NEW_NAME="$4"
    fi
  else
    NAME_ONLY=true
    OLD_NAME="$1"
    NEW_NAME="$2"
  fi
else
  echo "Usage: $0 OLD_ID NEW_ID [OLD_NAME NEW_NAME]  OR  $0 \"Old Name\" \"New Name\""
  exit 1
fi

printf 'DRY_RUN = %s\n' "$DRY_RUN"
if [[ "$NAME_ONLY" == "true" ]]; then
  echo "Mode: NAME-ONLY"
  printf "Old name: '%s' -> New name: '%s'\n" "$OLD_NAME" "$NEW_NAME"
else
  echo "Mode: ID (and optional name) change"
  printf "Old ID: '%s' -> New ID: '%s'\n" "$OLD_ID" "$NEW_ID"
  if [[ -n "$OLD_NAME" && -n "$NEW_NAME" ]]; then
    printf "Old name: '%s' -> New name: '%s'\n" "$OLD_NAME" "$NEW_NAME"
  fi
fi

# -----------------------
# Main work: ID changes
# -----------------------
if [[ "$NAME_ONLY" != "true" ]]; then
  if [[ -z "$OLD_ID" || -z "$NEW_ID" ]]; then
    echo "ERROR: both OLD_ID and NEW_ID must be provided (unless name-only)."
    exit 1
  fi

  for d in "${TARGET_DIRS[@]}"; do
    if [[ -d "$d" ]]; then
      echo "Scanning directory: $d"
      while IFS= read -r file; do
        [[ -z "$file" ]] && continue
        echo " - Found ID in: $file"
        replace_in_file "$file" "$OLD_ID" "$NEW_ID"
      done < <(grep_safe "$OLD_ID" "$d")
    fi

    if [[ -f "$d" ]]; then
      echo " - Updating file: $d"
      replace_in_file "$d" "$OLD_ID" "$NEW_ID"
    fi
  done

  # -----------------------
  # Best-effort: rename the package directory that contains MainActivity
  # -----------------------
  echo ""
  echo "Searching for MainActivity files to relocate package dir (best-effort)..."
  # Only attempt if both OLD_ID and NEW_ID are set
  if [[ -n "$OLD_ID" && -n "$NEW_ID" ]]; then
    old_path_fragment=$(echo "$OLD_ID" | tr '.' '/')
    new_path_fragment=$(echo "$NEW_ID" | tr '.' '/')

    # find MainActivity files
    while IFS= read -r -d '' ma; do
      ma_dir=$(dirname "$ma")
      echo " - Found MainActivity at: $ma (dir: $ma_dir)"
      if [[ "$ma_dir" == *"$old_path_fragment"* ]]; then
        base_dir=${ma_dir%$old_path_fragment}
        src_dir="$base_dir$old_path_fragment"
        dst_dir="$base_dir$new_path_fragment"
        echo "   Candidate move: $src_dir -> $dst_dir"

        if [[ "$DRY_RUN" == "true" ]]; then
          echo "   DRY-RUN: would create $dst_dir and move files from $src_dir"
          continue
        fi

        # create destination, move files (git mv if available to preserve history)
        mkdir -p "$dst_dir"
        if command -v git >/dev/null 2>&1; then
          # try git mv per-file to preserve history, handle failures gracefully
          shopt -s nullglob
          moved_any=false
          for f in "$src_dir"/*; do
            if [[ -e "$f" ]]; then
              git mv -k "$f" "$dst_dir/" 2>/dev/null || mv "$f" "$dst_dir/" || true
              moved_any=true
            fi
          done
          shopt -u nullglob
          if [[ "$moved_any" == "true" ]]; then
            echo "   Files moved with git mv/mv."
          else
            echo "   No files moved (source may be empty)."
          fi
        else
          mv "$src_dir"/* "$dst_dir/" 2>/dev/null || true
          echo "   Files moved with mv."
        fi

        # remove old dir if empty
        find "$src_dir" -type d -empty -delete || true
        echo "   Move attempted; please verify package declarations were updated in moved files."
      else
        echo "   MainActivity dir does not contain OLD_ID path fragment; skipping: $ma_dir"
      fi
    done < <(find android/app/src -type f \( -name 'MainActivity.kt' -o -name 'MainActivity.java' \) -print0 2>/dev/null || true)
  fi
fi

# -----------------------
# Main work: Name changes
# -----------------------
if [[ -n "$NEW_NAME" && -n "$OLD_NAME" ]]; then
  for d in "${TARGET_DIRS[@]}"; do
    if [[ -d "$d" ]]; then
      echo "Scanning for name changes in: $d"
      while IFS= read -r file; do
        [[ -z "$file" ]] && continue
        echo " - Found name in: $file"
        replace_in_file "$file" "$OLD_NAME" "$NEW_NAME"
      done < <(grep_safe "$OLD_NAME" "$d")
    fi

    if [[ -f "$d" ]]; then
      echo " - Updating file (name): $d"
      replace_in_file "$d" "$OLD_NAME" "$NEW_NAME"
    fi
  done
fi

# -----------------------
# Done
# -----------------------
echo ""
echo "SAFE RENAME COMPLETE."
echo "Backups (if any) are stored in: $BACKUP_DIR"
echo ""
if [[ "$DRY_RUN" == "true" ]]; then
  echo "DRY-RUN mode: no files were modified."
else
  echo "Run: flutter clean && flutter pub get && then test builds for each platform/flavor."
fi

exit 0
