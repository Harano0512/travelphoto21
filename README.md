README

# アプリケーション名
Travel Photo21

# アプリケーション概要
旅行で撮った写真を投稿して公開するWebアプリケーション
ユーザーは投稿にコメントを残したり、都道府県別で投稿を見ることができる

# 本番環境
https://travelphoto21.herokuapp.com/

## Basic認証
ID: admin
Pass: 0205

## テスト用アカウント
e-mail: test@test.com
password: aaaa1111

# 制作背景(意図)
旅行した写真をバラバラに投稿するのではなく、旅行毎にまとめた形で投稿できるようにしたかった。
都道府県毎に投稿を検索できることで、旅行に行く前や旅行中に、他人が投稿した写真をみて自分の旅行の参考にすることができる。

# DEMO
## トップページ
https://gyazo.com/1e8e6fb81d8a721cb6a130fc8ae2fa4a

・中心のメニューバーで最新記事をクリックすることで、ページ下部の最新記事一覧にリンク
・最新記事のタイトルをクリックすることで、該当の旅行ページへリンク

## 投稿詳細ページ
https://gyazo.com/265e7550f7b48bb90e7f8fa723c722ec
・旅行毎に作成した詳細ページを表示
・投稿されたアルバムをリストで表示
・ユーザー名からユーザーページへリンク
・日付からアルバムへリンク

## アルバムページ
https://gyazo.com/33bad2b55d2cab5e46e3b1158770a84a
・投稿された内容を表示
・自分の投稿のみ、編集・削除ができる
・ログインしている場合、コメントをすることができる
・自分のコメントのみ、削除ができる

## 

# 工夫したポイント


# 使用技術(開発環境)

# 課題や今後実装したい機能

# データベース設計


## usersテーブル

| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| nickname           | string    | null: false       |
| email              | string    | null: false       |
| encrypted_password | string    | null: false       |
| prefecture_id      | integer   | null: false       |

### association
has_many :contents
has_many :posts
has_many :comments


## contentsテーブル

| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| title              | string    | null: false       |
| from_date          | date      | null: false       |
| return_date        | date      | null: false       |
| user_id            | references| foreign_key: true |

### association
belongs_to :user
has_many :posts


## postsテーブル

| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| subject            | string    | null: false       |
| travel_date        | date      | null: false       |
| prefecture_id      | integer   | null: false       |
| article            | text      | null: false       |
| user_id            | references| foreign_key: true |
| content_id         | references| foreign_key: true |

### association
belongs_to :user
belongs_to :content
has_many_attached :images
 ※active_strageで複数画像投稿


## commentsテーブル

| Column             | Type      | Options           |
|--------------------|-----------|-------------------|
| text               | text      | null: false       |
| user_id            | references| foreign_key: true |
| post_id            | references| foreign_key: true |

### association
belongs_to :user
belongs_to :post


#### prefecture_idはactive hashにて実装
