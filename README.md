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
-has_many :displays

# displaysテーブル

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
| user               | references     | null: false, foreign_key: true |

# Association

-belongs_to :user_purchase
-belongs_to :user
 

# buysテーブル

| Column             | Type     | Options      |
| ------------------ | -------- | ------------ |
| post_code          | string   | null: false  |
| delivery_area_id   | integer  | null: false  |
| city               | string   | null: false  |
| addressline        | string   | null: false  |
| building           | string   |              |
| phone_number       | string   | null: false  |
| user_purchases     | references     | null: false, foreign_key: true |

# Association
-belongs_to :user_purchase


# user_purchasesテーブル

# Association
| user               | references     | null: false, foreign_key: true |
| display            | references     | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :buy
-belongs_to :display