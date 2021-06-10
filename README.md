README

# アプリケーション名
Travel Photo21

# アプリケーション概要
-　旅行で撮った写真を投稿して公開するWebアプリケーション

-　ユーザーは投稿にコメントを残したり、都道府県別で投稿を見ることができる

# 本番環境
https://travelphoto21.herokuapp.com/

## Basic認証
-　ID: admin

-　Pass: 0205

## テスト用アカウント
-　e-mail: test@test.com

-　password: aaaa1111

# 制作背景(意図)
-　旅行した写真をバラバラに投稿するのではなく、旅行毎にまとめた形で投稿できるようにしたかった。

-　都道府県毎に投稿を検索できることで、旅行に行く前や旅行中に、他人が投稿した写真をみて自分の旅行の参考にすることができる。

# DEMO
## トップページ
https://gyazo.com/1e8e6fb81d8a721cb6a130fc8ae2fa4a

![Uploading d150ebc55f8a7d42e9334b8d7b7a908d.gif…]()

-　中心のメニューバーで最新記事をクリックすることで、ページ下部の最新記事一覧にリンク

-　最新記事のタイトルをクリックすることで、該当の旅行ページへリンク

-　最新記事の写真は、投稿写真の１枚目を表示

## 投稿詳細ページ
https://gyazo.com/265e7550f7b48bb90e7f8fa723c722ec

-　旅行毎に作成した詳細ページを表示

-　投稿されたアルバムをリストで表示

-　ユーザー名からユーザーページへリンク

-　日付からアルバムへリンク

## ・投稿された内容を表示
https://gyazo.com/0395c00c170ff2bfcbbac1894715829c

-　自分の投稿のみ、編集・削除ができる

-　写真をクリックすると拡大で表示される


## コメント欄
https://gyazo.com/33bad2b55d2cab5e46e3b1158770a84a

-　ログインしている場合、コメントをすることができる

-　自分のコメントのみ、削除ができる

## 記事一覧表示機能
https://gyazo.com/7a70b0aa8fe2deca22e0cb97b2e4259c

-　トップページから記事一覧をクリックすると、一覧表示に移動

-　記事の写真は、投稿写真の１枚目を表示

-　５件以上はネクストページへ

## 写真一覧表示機能
https://gyazo.com/d150ebc55f8a7d42e9334b8d7b7a908d

-　トップページから写真一覧をクリックすると、一覧表示に移動

-　写真のみを一覧で表示

-　写真をクリックすると記事ページへ移動

## 都道府県別一覧
https://gyazo.com/c19e848574ae4ef445d2d4bd1c42bb3d

-　トップページから都道府県別一覧をクリックすると、リストが表示

-　アルバム投稿されている都道府県には、アルバム数が表示され、リンクがつく

-　クリックすると、その都道府県のアルバム一覧が表示される

## ユーザーページ
https://gyazo.com/7ccafa18cef29a842209557eab13720d

-　どのページでもユーザー名をクリックすると、そのユーザーのページへ移動

-　自分のユーザーページでは、ユーザー情報の編集ができる

-　ユーザー登録情報と、ユーザーが投稿したアルバム一覧がリスト表示される

-　日付からアルバムへリンク

## 検索機能
https://gyazo.com/500b37e8e9f5c2aa5fc5646c37405d8e

-　検索バーからキーワードを入力すると、該当のアルバムがリスト表示される

-　キーワードを入力しないで検索ボタンを押すと、全てのアルバムがリストで表示される


# 工夫したポイント
-　都道府県別一覧で、投稿の有無でリンクを分けることで、ユーザーが必要な情報を探しやすくした。

-　スクロールが長くなり過ぎないよう、記事やアルバム、写真などにgem kaminariによるpaginateを導入した

-　コメントされたタイミングがわかるよう、日本時間で分単位まで表示させた

-　記事一覧の写真は１枚だけ表示させるため、配列の[0]のみを取り出してリンクさせた

-　アルバム画面で写真を拡大表示できるよう実装した

# 使用技術(開発環境)
## バックエンド
Ruby, Ruby on rails
## フロントエンド
HTML, JavaScript
## データベース
MySQL SequelPro
## インフラ
AWS(S3)
## アプリケーションサーバー
heroku
## ソース管理
GitHub, GitHubDesktop
## テスト
RSpec
## エディタ
VSCode

# 課題や今後実装したい機能

-　アルバムや写真のお気に入り機能をつけて、マイページからお気に入りを探せるようにする

-　お気に入りに登録されたアルバムや写真を、”人気”としてトップページへ表示


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
belongs_to :prefecture


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
belongs_to :prefecture
has_many :comments

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
