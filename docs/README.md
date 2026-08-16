# loophack ドキュメント入口

このディレクトリは `loophack` の要件定義・計画・引き継ぎ情報を整理する場所です。
CLAUDE.md（リポジトリ直下）を読んだ上で、詳細はここから辿ってください。

## カテゴリ別ファイル

| ファイル | 内容 |
|---|---|
| [requirements.md](./requirements.md) | 要件定義（目的・スコープ・合意済みの設計方針・未決事項） |
| [implementation-plan.md](./implementation-plan.md) | 現行の実装計画（バージョン日付付き） |
| [backlog.md](./backlog.md) | 既知の課題・バックログ |
| [handoff.md](./handoff.md) | エージェント/開発再開時の引き継ぎメモ |
| [debugging.md](./debugging.md) | 実機・実環境でのデバッグ手順 |
| [external-services.md](./external-services.md) | 外部サービスのセットアップ手順 |
| [phases/phase1.md](./phases/phase1.md) | Phase 1詳細計画 |
| [phases/phase2.md](./phases/phase2.md) | Phase 2詳細計画 |

完了した計画項目は削除せず、該当ファイル内に✅を付けて履歴として残します。
廃止した機能・設計判断は削除せず `archive/` に移し、経緯を残します。
