#!/usr/bin/env bash
set -euo pipefail

FLUTTER_CHANNEL="${FLUTTER_CHANNEL:-stable}"
FLUTTER_HOME="${FLUTTER_HOME:-$HOME/flutter}"
FLUTTER_BASE_HREF="${FLUTTER_BASE_HREF:-/}"

if ! command -v flutter >/dev/null 2>&1; then
  if [ ! -x "$FLUTTER_HOME/bin/flutter" ]; then
    git clone https://github.com/flutter/flutter.git \
      --branch "$FLUTTER_CHANNEL" \
      --depth 1 \
      "$FLUTTER_HOME"
  fi

  export PATH="$FLUTTER_HOME/bin:$PATH"
fi

flutter --version
flutter config --enable-web
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter build web --release --base-href "$FLUTTER_BASE_HREF"
