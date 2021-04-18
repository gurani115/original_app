# README

## usersテーブル

| Column             | Type   | Options         |
| ------------------ | ------ | --------------- |
| name               | string | null: false     |
| employee_number    | string | null: false     |
| encrypted_password | string | null: false     |

### Association

- has_many :rooms
- has_many :messages

## roomsテーブル

| Column        | Type   | Option       |
| ------------- | ------ | ------------ |
| room_name     | string | null: false  |

### Association

- belongs_to :user
- has_many   :messages 


## messagesテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room