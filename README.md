# テーブル設計

## Users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association
- has_many :events
- has_many :memos
- has_many :tasks
- has_many :documents


## Events テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| title      | string     | null: false          |
| content    | text       | null: false          |
| start_time | datetime   |                      |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## Memos テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| memo       | text       | null: false          |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user


## Tasks テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| title      | string     | null: false          |
| deadline   | datetime   | null: false          |
| detail     | text       |                      |
| priority_id | integer    | null: false              |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to_active_hash :priority_id


## Storages テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| title      | string     | null: false          |
| detail     | text       |                      |
| user_id    | references | null: false, foreign_key: true |

### Association
- belongs_to :user

README.md

# アプリ名
- 

# 概要
- 

# 本番環境
- 

# 制作背景(意図)
- 

# DEMO

## トップページ

## 新規登録画面

## イベント機能
[![イベント追加](https://gyazo.com/9693eda2cfbd98ed3a3d8a8fe65b21b9)](https://gyazo.com/15acaf20c75d5ed3b75b2d560e0c5ec3)
## メモ機能

## タスク機能

## 資料管理機能

# 工夫したポイント
- メモ機能の非同期処理
- 追加予定のものでモーダルウィンドウをつける（イベントの追加と編集機能をモーダルウィンドウに変える）
- タスクの優先順位の部分にactive_hashを使った


# 使用技術(開発環境)
## バックエンド
- Ruby, Ruby on Rails

## フロントエンド
- JavaScript

## データベース
- MySQL, sequelPro

## インフラ
- AWS(ES2), Capistrano, Docker

## Webサーバ（本番環境）
- Nginx

## アプリケーションサーバ（本番環境）
- unicorn

## ソース管理
- GitHub, GitHubDesktop

## テスト
- RSpec

## エディタ
- VScode

# 課題や今後実装した機能
- 



