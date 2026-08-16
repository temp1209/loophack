# Phase 1 詳細計画

最終更新: 2026-08-16

## 対象

スマホ単体（Wi-Fi接続変化、Bluetooth接続変化、Activity Recognition API、
充電状態、Sleep API等）で検知できる行動。

- 睡眠
- 帰宅・外出
- 仮眠開始

具体的にどの行動から実装するかは絞らず、まず [requirements.md](../requirements.md)
のEvent抽象（共通の記録基盤）を先に固める方針で合意済み。

## 未着手のタスク

- Event抽象の具体的なDBスキーマ設計
- 各トリガー（Wi-Fi/Bluetooth/Activity Recognition/充電状態/Sleep API）の
  検知実装の優先順位付け
- 主観指標（気分・疲労度）を尋ねる時間トリガーの具体設計
- ダッシュボードの最小構成（カレンダーヒートマップ／トレンドグラフ／分布統計）
