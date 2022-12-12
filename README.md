# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_name          | string | null: false               |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |

### Association
has_many :recipes
has_many :favorites, dependent: :destroy

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
has_many :favorites, dependent: :destroy

## favorites テーブル

| Column             | Type    |
| ------------------ | ------- |
| recipe_id          | integer |
| user_id            | integer |

### Association
belongs_to :user
belongs_to :recipe

# アプリケーション名
BabyFoodRecipe

# アプリケーション概要
離乳食のレシピを投稿し、ユーザー同士で共有できる。

# URL
https://babyfoodrecipe-38595.onrender.com

# テスト用アカウント
Basic認証パスワード:2222
Basic認証ID:admin
メールアドレス:aaa@com
パスワード:1a1a1a

# 利用方法

## 離乳食レシピ投稿
1.トップページのヘッダーからユーザー新規登録を行う
2.ヘッダーの投稿するボタンから、レシピの内容(料理名、材料、作り方、紹介文、画像、月齢の選択、分類の選択)を入力し投稿する

## レシピの共有
1.レシピのハートマークを押すとお気に入り登録される
2.ヘッダーのユーザー名をクリックすると、マイページに遷移される
3.自分の投稿内容が表示され、お気に入り表示でお気に入りしたレシピ内容を表示できる

# アプリケーションを作成した背景
妻や自身の体験を元に、離乳食を作るときどういうものを作ったらいいかわからず、本などを参考にし作っていた。本でページをめくって調べることに、手間に感じた。材料名や月齢ごとに検索をして、離乳食のレシピを調べることができたら、効率的になると思い開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1ENRrVBWk2aCpJ3_kElZIKEHzQbZ5Q2DhRkbzbXpoWLE/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

## ユーザー登録ログイン
[![Image from Gyazo](https://i.gyazo.com/247603bc1aecaf7aeda35ede2fae5f14.png)](https://gyazo.com/247603bc1aecaf7aeda35ede2fae5f14)
新規登録画面

ユーザーネーム、メールアドレス、パスワードを入力し、新規登録

[![Image from Gyazo](https://i.gyazo.com/a533f320904aa157a8c7b70afa668be9.png)](https://gyazo.com/a533f320904aa157a8c7b70afa668be9)
ログイン画面

メールアドレス、パスワードを入力し、ログイン

## 一覧表示画面(トップページ)
[![Image from Gyazo](https://i.gyazo.com/863e05d9d30c2098a72a310bfa285a09.gif)](https://gyazo.com/863e05d9d30c2098a72a310bfa285a09)

## レシピ投稿
[![Image from Gyazo](https://i.gyazo.com/580ca2a68b914f6dc53a1fc926e3ac24.gif)](https://gyazo.com/580ca2a68b914f6dc53a1fc926e3ac24)
新規投稿画面→トップページ→詳細画面
ヘッダーから、投稿するをクリックすると新規投稿画面に遷移される。
レシピの内容を入力し、投稿ボタンをクリックする。

## レシピ編集
[![Image from Gyazo](https://i.gyazo.com/08d1be67fc1ef83684e0c070a0437ab1.gif)](https://gyazo.com/08d1be67fc1ef83684e0c070a0437ab1)

詳細画面の編集ボタンをクリックし、編集したい内容を入力し、投稿すると編集内容が反映される

## レシピ削除
[![Image from Gyazo](https://i.gyazo.com/df9b743f8338187d7ace20b906877ce1.gif)](https://gyazo.com/df9b743f8338187d7ace20b906877ce1)

詳細画面の削除ボタンをクリックすると削除できる

## マイページ表示
[![Image from Gyazo](https://i.gyazo.com/117a3720cf039d84eeb7b4cc03c4a942.gif)](https://gyazo.com/117a3720cf039d84eeb7b4cc03c4a942)

ヘッダーのユーザーネームをクリックするとマイページへ遷移する。
マイページにはユーザーが投稿したレシピが表示される。

## お気に入り機能
[![Image from Gyazo](https://i.gyazo.com/03130f2d18f4232f661f39d6df9522e3.gif)](https://gyazo.com/03130f2d18f4232f661f39d6df9522e3)

レシピのハートマークをクリックするとお気に入り登録できる。
お気に入り登録したレシピはマイページからお気に入りレシピをクリックすると表示できる。

[![Image from Gyazo](https://i.gyazo.com/9c5d4d6e350fa983bc6144d5c2086498.gif)](https://gyazo.com/9c5d4d6e350fa983bc6144d5c2086498)

再度、ハートマークをクリックするとお気に入りを解除できる

# 実装予定の機能
お気に入り登録を非同期通信で行えるようにする予定。
レシピにコメント機能を実装し、ユーザー同士がコミュニケーションをとれるようにする予定。
一覧表示を分類ごとに表示させる予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/1c6fcc3ca16d760eac47069b0ca7ff79.png)](https://gyazo.com/1c6fcc3ca16d760eac47069b0ca7ff79)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/c15a9e70d10f3a68dea0e7716a218d49.png)](https://gyazo.com/c15a9e70d10f3a68dea0e7716a218d49)

#　開発環境
・フロントエンド
・バックエンド
・インフラ
・テキストエディタ
・タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/yyhoshino/babyfoodrecipe.git
% cd babyfoodrecipe
% bundlie install
% yarn install

# 工夫したポイント
## シンプル見やすいデザイン
・見やすいアプリケーションを目指し、色合いは統一感を持たせ、シンプルなデザインにしました。
[![Image from Gyazo](https://i.gyazo.com/503d1645ba8b126e9f3948b67ffb920e.jpg)](https://gyazo.com/503d1645ba8b126e9f3948b67ffb920e)
一覧画面
[![Image from Gyazo](https://i.gyazo.com/8532e2739767b630499e0551457d9a59.gif)](https://gyazo.com/8532e2739767b630499e0551457d9a59)
詳細画面
・レシピ詳細では項目を枠で囲んだり、赤文字にするなどして目立つようにして、区切りがわかりやすくなるよう反映させました。また、内容を左寄せにもなるようにして、見やすくしています。

## 手軽に簡単に検索できるように
・検索フォームはトップページに設置し、手軽に検索できるようにしました。料理名から、月齢、分類で検索できるようにし、ユーザーが求めたいレシピを探せるようにしています。
[![Image from Gyazo](https://i.gyazo.com/18b869f71515ae02ea5d3503953ea5ed.gif)](https://gyazo.com/18b869f71515ae02ea5d3503953ea5ed)