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
