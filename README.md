# イベントクロスサービス-サーバーサイド
開発ドキュメントを以下に記す

## 技術概要
 Tech               | Version
 ------------------ | ------
 ruby               | 2.5.1
 rails              | 5.0.7
 nginx              | 1.11.x
 Docker             | 18.03.1-ce-mac65 (24312)
 mysql              | 5.7.22
 redis(TODO)        | 4.0.10

## ローカル環境構築手順
1. `docker-compose.yml` をリネームコピー
    - `cp docker-compose.yml.sample docker-compose.yml` 
2. `.env` をリネームコピー
    - `cp .env.sample .env`
3. プロジェクトルートで `docker-compose up` を叩く
4. `docker/mysql/password.yml` を参考に、mysql接続し、以下のDBを作成
    - event_cross_development
    - event_cross_test(テスト用)
5. webコンテナにssh接続後 `docker exec -it event-cross-rails_web_1 bash` 、マイグレーション実行 `bin/rails db:migrate`
    - マイグレーション実行は、マイグレーション更新あり次第、都度行う

## 開発フロー(TODO)
## コード規約(TODO)