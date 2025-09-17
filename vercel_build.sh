#!/usr/bin/env bash
set -euo pipefail

echo "[Vercel] Installing Flutter SDK"
FLUTTER_VERSION=${FLUTTER_VERSION:-3.22.0}
git clone --depth 1 --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git _flutter
export PATH="$PWD/_flutter/bin:$PATH"
flutter --version

echo "[Vercel] Enabling web"
flutter config --enable-web

echo "[Vercel] Fetching packages"
flutter pub get

echo "[Vercel] Building web (release)"
flutter build web --release --no-tree-shake-icons

echo "[Vercel] Build complete: build/web"

