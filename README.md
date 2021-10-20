# テーブル設計

# usersテーブル

| Column             | Type   | Options      |
| ------------------ | ------ | -----------  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| nickname           | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| kana_first_name    | string | null: false  |
| kana_last_name     | string | null: false  |
| birthday           | date   | null: false  |


# displaysテーブル

| Column             | Type           | Options     |
| ------------------ | -------------- | ----------- |
| image              | ActiveStorage  |             |
| item_name          | string         | null: false  |
| item_explanation   | text           | null: false  |
| detail             | string         | null: false  |
| delivery           | string         | null: false  |
| price              | integer        | null: false  |
| user               | references     | null: false, foreign_key: true |
 

# buysテーブル

| Column             | Type     | Options      |
| ------------------ | -------- | ------------ |
| date               | datatime | null: false  |
| post_code          | string   | null: false  |
| city               | string   | null: false  |
| addressline        | string   | null: false  |
| phonenumber        | numeric  | null: false  |

# user_purchaseテーブル

| Column             | Type           | Options                        |
| ------------------ | -------------- | ------------------------------ |
| user               | references     | null: false, foreign_key: true |
| display            | references     | null: false, foreign_key: true |