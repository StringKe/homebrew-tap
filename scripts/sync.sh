#!/bin/sh
# 按 tomato-cli 的 GitHub Release 重新生成 Formula/tomato-cli.rb
# 用法：scripts/sync.sh [版本号]，不给版本号时取最新 release
set -eu

REPO="StringKe/tomato-cli"
ROOT=$(cd "$(dirname "$0")/.." && pwd)
version="${1:-}"

if ! command -v jq >/dev/null 2>&1; then
  echo "需要 jq" >&2
  exit 1
fi

if [ -z "$version" ]; then
  tag=$(curl -fsSL --retry 3 "https://api.github.com/repos/${REPO}/releases/latest" | jq -r .tag_name)
  version="${tag#v}"
fi
base="https://github.com/${REPO}/releases/download/v${version}"

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

sha() {
  curl -fsSL --retry 3 --retry-delay 2 "$base/$1" -o "$tmpdir/$1"
  if command -v sha256sum >/dev/null 2>&1; then
    sha256sum "$tmpdir/$1" | cut -c1-64
  else
    shasum -a 256 "$tmpdir/$1" | cut -c1-64
  fi
}

mac_arm=$(sha tomato-aarch64-apple-darwin.tar.gz)
mac_x64=$(sha tomato-x86_64-apple-darwin.tar.gz)
linux_arm=$(sha tomato-aarch64-unknown-linux-gnu.tar.gz)
linux_x64=$(sha tomato-x86_64-unknown-linux-gnu.tar.gz)

mkdir -p "$ROOT/Formula"
sed \
  -e "s|@VERSION@|$version|g" \
  -e "s|@SHA_MAC_ARM@|$mac_arm|" \
  -e "s|@SHA_MAC_X64@|$mac_x64|" \
  -e "s|@SHA_LINUX_ARM@|$linux_arm|" \
  -e "s|@SHA_LINUX_X64@|$linux_x64|" \
  "$ROOT/templates/tomato-cli.rb" > "$ROOT/Formula/tomato-cli.rb"
echo "已生成 Formula/tomato-cli.rb -> $version"
