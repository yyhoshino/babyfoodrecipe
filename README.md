# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_name          | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |

### Association
has_many :recipes
has_many :favorites

## recipes テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| dish_name          | string     | null: false                   |
| ingredient         | text       | null: false                   |
| make               | text       | null: false                   |
| introduction       | text       | null: false                   |
| user               | references | null: false, foreign_key: true|
| moon_age_id        | integer    | null: false                   |
| classification_id  | integer    | null: false                   |

### Association
belongs_to :user
has_many :favorites

## favorites テーブル

| Column             | Type    |
| ------------------ | ------- |
| recipe_id          | integer |
| user_id            | integer |

### Association
belongs_to :user
belongs_to :recipe
