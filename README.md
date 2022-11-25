# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_name          | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |

### Association
has_many :recipes
has_many :follows
has_many :favorites

## recipes テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| dish_name          | string     | null: false                   |
| ingredient         | text       | null: false                   |
| make               | text       | null: false                   |
| introduction       | text       | null: false                   |
| user               | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_many :favorites
has_many :recipe_categories
has_many :categories, through: :recipe_categories

## favorites テーブル

| Column             | Type    |
| ------------------ | ------- |
| recipe_id          | integer |
| user_id            | integer |

### Association
belongs_to :user
belongs_to :recipe

## follows テーブル

| Column             | Type    |
| ------------------ | ------- |
| follower_id        | integer |
| followee_id        | integer |

### Association
belongs_to :user

## recipe_categories テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| recipe_id          | integer | null: false |
| category_id        | integer | null: false |

### Association
belongs_to :recipes
belongs_to :category

## categories テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |


### Association
has_many :recipe_categories
has_many :recipes, through: :recipe_categories