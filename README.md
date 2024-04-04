## users

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| name                  | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |

### Association


## items

| Column      | Type       | Options                |
| ------------| ---------- | ---------------------- |
| item_name   | string     | null: false, limit: 40 |
| size_id     | integer    | null: false            |
| price       | integer    | null: false            |


### Association