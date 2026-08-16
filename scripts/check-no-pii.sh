#!/usr/bin/env bash
# コミット前に個人情報・秘密情報の混入をローカルで検出するスクリプト。
# 使い方: ./scripts/check-no-pii.sh
#   - ステージ済みの差分（git diff --cached）を対象にする
#   - 差分が無い場合は追跡中の全ファイルを対象にする（初回チェック用）
# 同じチェックが .github/workflows/pii-check.yml でCI上でも実行される。
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

# 自分自身とこのファイルの説明文はチェック対象から除外する
EXCLUDE_PATHS=(
  ':(exclude)scripts/check-no-pii.sh'
  ':(exclude)CLAUDE.md'
)

if ! git diff --cached --quiet -- . "${EXCLUDE_PATHS[@]}" 2>/dev/null; then
  TARGET_FILES=$(git diff --cached --name-only --diff-filter=ACM -- . "${EXCLUDE_PATHS[@]}")
else
  TARGET_FILES=$(git ls-files -- . "${EXCLUDE_PATHS[@]}")
fi

if [ -z "$TARGET_FILES" ]; then
  echo "check-no-pii: 対象ファイルなし。スキップ。"
  exit 0
fi

FOUND=0

# メールアドレス（example.com 等の明示的なプレースホルダードメインは許容）
EMAIL_REGEX='[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'
ALLOWED_EMAIL_DOMAINS_REGEX='@(example\.com|example\.org|example\.net|test\.com|localhost)'

while IFS= read -r file; do
  [ -f "$file" ] || continue

  MATCHES=$(grep -nE "$EMAIL_REGEX" "$file" 2>/dev/null || true)
  if [ -n "$MATCHES" ]; then
    REAL_MATCHES=$(echo "$MATCHES" | grep -viE "$ALLOWED_EMAIL_DOMAINS_REGEX" || true)
    if [ -n "$REAL_MATCHES" ]; then
      echo "[check-no-pii] $file: メールアドレスらしき文字列を検出"
      echo "$REAL_MATCHES"
      FOUND=1
    fi
  fi

  # 日本の電話番号らしきパターン（090-1234-5678 等）
  PHONE_MATCHES=$(grep -nE '0[0-9]{1,4}-[0-9]{1,4}-[0-9]{3,4}' "$file" 2>/dev/null || true)
  if [ -n "$PHONE_MATCHES" ]; then
    echo "[check-no-pii] $file: 電話番号らしき文字列を検出"
    echo "$PHONE_MATCHES"
    FOUND=1
  fi
done <<< "$TARGET_FILES"

if [ "$FOUND" -ne 0 ]; then
  echo ""
  echo "個人情報の可能性がある文字列が見つかりました。コミット内容を確認してください。"
  echo "プレースホルダーが必要な場合は user@example.com のような明示的なダミーを使ってください。"
  exit 1
fi

echo "check-no-pii: 問題なし。"
exit 0
