# README

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
