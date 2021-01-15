# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :events
- has_many :memos


## plans テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| title      | string     | null: false          |
| content    | text       | null: false          |
| start_time | datetime   |                      |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## memos テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| memo       | string     | null: false          |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user


