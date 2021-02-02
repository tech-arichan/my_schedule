# アプリ名
- GroupSKD

# 概要
- 少人数のチームや事務所での予定共有アプリ

# 本番環境
- http://groupskd.com/
- ログインはゲストユーザーを利用してください
[![Image from Gyazo](https://i.gyazo.com/7a45b548839e12412fb64866a0efb9aa.gif)](https://gyazo.com/7a45b548839e12412fb64866a0efb9aa)

# 制作背景(意図)
- わかりやすいシンプルなスケジュール管理アプリ。
- ターゲット層：パソコン、スマホが得意じゃない人。小規模事務所向け。
- もしかしたらマイノリティではあるかもしれないが既存のスケジュール管理アプリが「色々あって複雑」「う〜ん・・・わからん」という普段仕事でパソコンに触れない、使えない人の問題を解決する。（機能を絞って、できる限り見やすく、シンプルに。「誰でも簡単に」がコンセプト）

- 開発理由・経緯：
勤めていた会社での実体験ですが、毎週月曜日の朝礼の際に今週の予定を口頭で伝え、それをメモして他の人のスケジュールを確認。営業に出る時はホワイトボードに行き先と帰社時間を記入する。このような状況で上司にGoogleカレンダーやTimeTree等、既存のスケジュール管理アプリがあるので勧めると「わからない」や「機能が色々あって複雑」などの意見がありました。このような経験から、スマートフォンやパソコンに苦手意識を持っている人でも簡単に扱えるようなシンプルな予定管理アプリを作ろうと考えました。

# DEMO
## トップページ
- メインページ（カレンダー）
[![Image from Gyazo](https://i.gyazo.com/c8f1b7a0244310d7faf6573e4e4557f0.png)](https://gyazo.com/c8f1b7a0244310d7faf6573e4e4557f0)

## 新規登録画面
- ユーザー登録機能
[![Image from Gyazo](https://i.gyazo.com/68e47361beca1df6eaee768b8c55ebd1.gif)](https://gyazo.com/68e47361beca1df6eaee768b8c55ebd1)

## イベント機能
- イベント追加機能
[![イベント追加](https://i.gyazo.com/15acaf20c75d5ed3b75b2d560e0c5ec3.gif)](https://gyazo.com/15acaf20c75d5ed3b75b2d560e0c5ec3)
- イベント編集機能
[![Image from Gyazo](https://i.gyazo.com/e74dec44efe8f1ed188c44bbdd3c4c95.gif)](https://gyazo.com/e74dec44efe8f1ed188c44bbdd3c4c95)
- イベント削除機能
[![Image from Gyazo](https://i.gyazo.com/7c193b783addc928e668c1c1d086a999.gif)](https://gyazo.com/7c193b783addc928e668c1c1d086a999)

## メモ機能
- メモ追加機能
[![Image from Gyazo](https://i.gyazo.com/210630184f63882895a6db8ff9593ec6.gif)](https://gyazo.com/210630184f63882895a6db8ff9593ec6)

## タスク機能
- タスク登録機能
[![Image from Gyazo](https://i.gyazo.com/6bb425fe7280d029935a7c35808652e8.gif)](https://gyazo.com/6bb425fe7280d029935a7c35808652e8)

## 資料管理機能
- 写真投稿機能
[![Image from Gyazo](https://i.gyazo.com/01b1315a089066e1bf2ad5255d18579b.gif)](https://gyazo.com/01b1315a089066e1bf2ad5255d18579b)

# 工夫したポイント
- タスクの優先順位の部分にactive_hashを使った


# 使用技術(開発環境)
## バックエンド
- Ruby, Ruby on Rails

## フロントエンド
- HTML, CSS, JavaScript

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

# 課題や今後実装する機能
- とりあえず機能だけを先に作ったため全体的に改善が必要。徐々に改善していく（特にviewの見直しが必要）
- メモ投稿の非同期処理
- メモ投稿のイベント、タスクの追加や編集機能のモーダルウィンドウに変更
- カレンダーの祝日表示（後々日本以外の国も）
- simple_calendarを利用している。色々とアレンジもしたいのでできる限り編集しやすいようにカレンダーをJavaScriptを用いて表示する
- 登録者用のページ作成。TOPには全体の予定を入れ、各個人の予定は個々のページに表示できるよう作成。
- 個人ページのカレンダーは月と週に切り替え可能にする
- 1年後、2年後などの予定が簡単に検索できるような機能を追加
- 最後にパソコンやスマホの操作を苦手としている人を対象にアンケート調査をする


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
