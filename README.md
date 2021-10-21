# テーブル設計

# usersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| email              | string | null: false  |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| kana_first_name    | string | null: false  |
| kana_last_name     | string | null: false  |
| birthday           | date   | null: false  |

# Association
-belongs_to :user_purchase

# displaysテーブル

| Column             | Type           | Options     |
| ------------------ | -------------- | ----------- |
| image              | ActiveStorage  |             |
| item_name          | string         | null: false  |
| item_explanation   | text           | null: false  |
| item_category      | integer        | null: false  |
| item_condition     | integer        | null: false  |
| delivery_fee       | integer        | null: false  |
| delivery_area      | integer        | null: false  |
| delivery_date      | integer        | null: false  |
| price              | integer        | null: false  |
| user               | references     | null: false, foreign_key: true |

# Association

-belongs_to :user_purchase
 

# buysテーブル

| Column             | Type     | Options      |
| ------------------ | -------- | ------------ |
| post_code          | string   | null: false  |
| prefectures        | integer  | null: false  |
| city               | string   | null: false  |
| addressline        | string   | null: false  |
| phone_number       | string   | null: false  |

# Association
-belongs_to :user_purchase


# user_purchaseテーブル

# Association
| ------------------ | -------------- | ------------------------------ |
| user               | references     | null: false, foreign_key: true |
| display            | references     | null: false, foreign_key: true |