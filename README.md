# テーブル設計

## Users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :events


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
| memo       | string     | null: false          |

### Association
- 

## Tasks テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| title      | string     | null: false          |
| deadline   | datetime   | null: false          |
| detail     | text       |                      |

### Association
- 


## Documents テーブル

| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
| title      | string     | null: false          |
| detail     | text       |                      |
<!-- | image      | datetime   | null: false          | -->

### Association
- 
