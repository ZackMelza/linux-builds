#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
backup_suffix=".backup.$(date +%Y%m%d%H%M%S)"

backup_existing() {
  local target_path="$1"
  local backup_path="${target_path}${backup_suffix}"
  local counter=1

  # Preserve an earlier backup even if setup is rerun within the same second.
  while [[ -e "$backup_path" || -L "$backup_path" ]]; do
    backup_path="${target_path}${backup_suffix}.${counter}"
    ((counter += 1))
  done

  mv -- "$target_path" "$backup_path"
  printf 'move %s -> %s\n' "$target_path" "$backup_path"
}

link_file() {
  local source_path="$1"
  local target_path="$2"
  local target_dir
  target_dir="$(dirname "$target_path")"

  mkdir -p "$target_dir"

  if [[ -L "$target_path" ]]; then
    local current_target
    current_target="$(readlink -f "$target_path" || true)"
    if [[ "$current_target" == "$source_path" ]]; then
      printf 'ok   %s\n' "$target_path"
      return
    fi
    backup_existing "$target_path"
  elif [[ -e "$target_path" ]]; then
    backup_existing "$target_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'link %s -> %s\n' "$target_path" "$source_path"
}

while IFS= read -r source_path; do
  rel_path="${source_path#"$repo_root/config/"}"
  link_file "$source_path" "$HOME/.config/$rel_path"
done < <(find "$repo_root/config" -type f | sort)

while IFS= read -r source_path; do
  rel_path="${source_path#"$repo_root/local/bin/"}"
  link_file "$source_path" "$HOME/.local/bin/$rel_path"
done < <(find "$repo_root/local/bin" -type f | sort)

printf 'done\n'
