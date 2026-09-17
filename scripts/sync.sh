#!/bin/sh
# 按 GitHub Release 重新生成 Formula/*.rb
# 用法：scripts/sync.sh [包名] [版本号]
#   包名省略时同步全部包；版本号省略时取最新 release
set -eu

ROOT=$(cd "$(dirname "$0")/.." && pwd)

if ! command -v jq >/dev/null 2>&1; then
  echo "需要 jq" >&2
  exit 1
fi

# sha_of <base-url> <文件名>：下载归档并输出 sha256
sha_of() {
  tmpdir=$(mktemp -d)
  trap 'rm -rf "$tmpdir"' EXIT
  curl -fsSL --retry 3 --retry-delay 2 "$1/$2" -o "$tmpdir/$2"
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$tmpdir/$2" | cut -c1-64
  else
    shasum -a 256 "$tmpdir/$2" | cut -c1-64
  fi
  rm -rf "$tmpdir"
  trap - EXIT
}

latest_version() {
  tag=$(curl -fsSL --retry 3 "https://api.github.com/repos/$1/releases/latest" | jq -r .tag_name)
  printf '%s' "${tag#v}"
}

sync_tomato_cli() {
  version="${1:-$(latest_version StringKe/tomato-cli)}"
  base="https://github.com/StringKe/tomato-cli/releases/download/v${version}"
  mac_arm=$(sha_of "$base" tomato-aarch64-apple-darwin.tar.gz)
  mac_x64=$(sha_of "$base" tomato-x86_64-apple-darwin.tar.gz)
  linux_arm=$(sha_of "$base" tomato-aarch64-unknown-linux-gnu.tar.gz)
  linux_x64=$(sha_of "$base" tomato-x86_64-unknown-linux-gnu.tar.gz)
  mkdir -p "$ROOT/Formula"
  sed \
    -e "s|@VERSION@|$version|g" \
    -e "s|@SHA_MAC_ARM@|$mac_arm|" \
    -e "s|@SHA_MAC_X64@|$mac_x64|" \
    -e "s|@SHA_LINUX_ARM@|$linux_arm|" \
    -e "s|@SHA_LINUX_X64@|$linux_x64|" \
    "$ROOT/templates/tomato-cli.rb" > "$ROOT/Formula/tomato-cli.rb"
  echo "已生成 Formula/tomato-cli.rb -> $version"
}

sync_stdagent() {
  version="${1:-$(latest_version StringKe/std-agent)}"
  base="https://github.com/StringKe/std-agent/releases/download/v${version}"
  mac_arm=$(sha_of "$base" "std-agent_${version}_darwin_arm64.tar.gz")
  mac_x64=$(sha_of "$base" "std-agent_${version}_darwin_amd64.tar.gz")
  linux_arm=$(sha_of "$base" "std-agent_${version}_linux_arm64.tar.gz")
  linux_x64=$(sha_of "$base" "std-agent_${version}_linux_amd64.tar.gz")
  mkdir -p "$ROOT/Formula"
  sed \
    -e "s|@VERSION@|$version|g" \
    -e "s|@SHA_MAC_ARM@|$mac_arm|" \
    -e "s|@SHA_MAC_X64@|$mac_x64|" \
    -e "s|@SHA_LINUX_ARM@|$linux_arm|" \
    -e "s|@SHA_LINUX_X64@|$linux_x64|" \
    "$ROOT/templates/stdagent.rb" > "$ROOT/Formula/stdagent.rb"
  echo "已生成 Formula/stdagent.rb -> $version"
}

case "${1:-all}" in
  tomato-cli) sync_tomato_cli "${2:-}" ;;
  stdagent) sync_stdagent "${2:-}" ;;
  all) sync_tomato_cli ""; sync_stdagent "" ;;
  *) echo "未知包名: $1（可用: tomato-cli, stdagent, all）" >&2; exit 1 ;;
esac
