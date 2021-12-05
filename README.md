# テーブル設計

# usersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| kana_first_name    | string | null: false  |
| kana_last_name     | string | null: false  |
| birthday           | date   | null: false  |

# Association
-has_many :items
-has_many :user_purchases
-has_many :comments

# itemsテーブル

| Column             | Type           | Options     |
| ------------------ | -------------- | ----------- |
| item_name          | string         | null: false  |
| item_explanation   | text           | null: false  |
| item_category_id   | integer        | null: false  |
| item_condition_id  | integer        | null: false  |
| delivery_fee_id    | integer        | null: false  |
| delivery_area_id   | integer        | null: false  |
| delivery_date_id   | integer        | null: false  |
| price              | integer        | null: false  |
| tag_name           | string         | null: false  |
| user               | references     | null: false, foreign_key: true |

# Association

-has_one :user_purchase
-belongs_to :user
-has_many :comments
 

# buysテーブル

| Column             | Type     | Options      |
| ------------------ | -------- | ------------ |
| post_code          | string   | null: false  |
| delivery_area_id   | integer  | null: false  |
| city               | string   | null: false  |
| addressline        | string   | null: false  |
| building           | string   |              |
| phone_number       | string   | null: false  |
| user_purchase     | references     | null: false, foreign_key: true |

# Association
-belongs_to :user_purchase


# user_purchasesテーブル

# Association
| user               | references     | null: false, foreign_key: true |
| item               | references     | null: false, foreign_key: true |

-has_one :buy
-belongs_to :user
-belongs_to :item

# commentsテーブル
| Column             | Type           | Options                              |
| ------------------ | -------------- | ------------------------------------ |
| text               | text           |                                      |
| user               | references     | null: false, foreign_key: true |
| item               | references     | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item