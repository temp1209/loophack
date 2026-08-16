# loophack ドキュメント入口

このディレクトリは `loophack` の要件定義・計画・引き継ぎ情報を整理する場所です。
CLAUDE.md（リポジトリ直下）を読んだ上で、詳細はここから辿ってください。

## カテゴリ別ファイル

| ファイル | 内容 |
|---|---|
| [requirements.md](./requirements.md) | 要件定義書（1つに集約。変更は変更履歴に追記） |
| [implementation-plan.md](./implementation-plan.md) | 実装計画（TODOリストとして運用） |
| [handoff.md](./handoff.md) | エージェント/開発再開時の引き継ぎメモ |
| [debugging.md](./debugging.md) | 実機・実環境でのデバッグ手順 |
| [external-services.md](./external-services.md) | 外部サービスのセットアップ手順 |

フェーズでは区切らず、機能・修正単位で進める。
完了したTODO項目は削除せず✅を付けて履歴として残す。
廃止した機能・設計判断は削除せず `archive/` に移し、経緯を残す。
