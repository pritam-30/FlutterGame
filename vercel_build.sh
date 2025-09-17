#!/usr/bin/env bash
set -euo pipefail

echo "[Vercel] Installing Flutter SDK (stable channel)"
git clone --depth 1 --branch stable https://github.com/flutter/flutter.git _flutter
export PATH="$PWD/_flutter/bin:$PATH"
flutter --version

echo "[Vercel] Configuring web and precaching"
flutter config --enable-web
flutter precache --web

echo "[Vercel] Fetching packages"
flutter pub get

echo "[Vercel] Building web (release)"
flutter build web --release --no-tree-shake-icons

echo "[Vercel] Build complete: build/web"

