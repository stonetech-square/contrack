# build_macos.sh
#!/bin/bash
source .env
flutter build macos --release \
  --dart-define=PROJECT_URL="$PROJECT_URL" \
  --dart-define=PROJECT_KEY="$PROJECT_KEY" \
  --dart-define=LOCAL_DB_KEY="$LOCAL_DB_KEY"
