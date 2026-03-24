# React Router Custom Templates

`cloudflare` テンプレートはルートの `Makefile` から操作できます。

## コマンドの使い分け

- 初回セットアップ時: `make install`
- 使えるコマンドを確認したい時: `make help`
- 開発サーバーを起動したい時: `make dev`
- Wranglerで本番ビルド相当をローカル確認したい時: `make preview`
- Wranglerでリモート環境に近い確認をしたい時: `make preview-remote`
- 本番用ビルドを作りたい時: `make build`
- デプロイしたい時: `make deploy`
- デプロイサイズだけ先に確認したい時: `make dry-run`
- 型チェック（`wrangler types` 含む）を実行したい時: `make typecheck`
- スキーマ変更後にマイグレーションSQLを生成したい時: `make db-generate`
- ローカルD1に未適用マイグレーションを反映したい時: `make apply`
- 現在適用済みのマイグレーションを確認したい時: `make current`
- リモートD1を特定時点へ戻したい時: `make rollback TO=2026-03-23T00:00:00Z`

## 典型的な流れ

```bash
make install
make db-generate
make apply
make current
make dev
```
