# README

## usersテーブル

| Column             | Type   | Options         |
| ------------------ | ------ | --------------- |
| name               | string | null: false     |
| employee_number    | string | null: false     |
| encrypted_password | string | null: false     |

### Association

- has_many :rooms

## roomsテーブル

| Column        | Type   | Option       |
| ------------- | ------ | ------------ |
| group_name    | string | null: false  |
| species       | string | null: false  |
| first_work    | string | null: false  |
| second_work   | string |              |
| third_work    | string |              |
| fourth_work   | string |              |
| fifth_work    | string |              |
| first_text    | string | null: false  |
| second_text   | string |              |
| third_text    | string |              |
| fourth_text   | string |              |
| fifth_text    | string |              |

### Association

- belongs_to :user
