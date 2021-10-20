# テーブル設計

# usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | text   | null: false |
| name               | string | null: false |
| kana_name          | string | null: false |
| birthday           | string | null: false |


# displayテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image      | ActiveStorage  |             |
| catch_copy | text          | null: false  |
| concept    | text          | null: false  |
| detail     | string        | null: false  |
| delivery   | string        | null: false  |
| price      | numeric       | null: false  |
| user       | references    | null: false, foreign_key: true |


# buyテーブル

| Column             | Type     | Options      |
| ------------------ | -------- | ------------ |
| card_number        | numeric  | null: false  |
| date               | datatime | null: false  |
| post_code          | string   | null: false  |
| city               | string   | null: false  |
| addressline        | string   | null: false  |
| phonenumber        | numeric  | null: false  |