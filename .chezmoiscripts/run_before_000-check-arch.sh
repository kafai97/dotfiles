#!/usr/bin/env zsh

OS=$(uname -s)
ARCH=$(uname -m)
OS_ARCH=""

unsupported_arch() {
  echo "does not support $OS/$ARCH at this time."
  exit 1
}

case $OS in
Darwin)
  case $ARCH in
  x86_64 | amd64)
    OS_ARCH=darwin_amd64
    ;;
  arm64)
    OS_ARCH=darwin_arm64
    ;;
  *)
    unsupported_arch
    ;;
  esac
  ;;
*)
  unsupported_arch
  ;;
esac
