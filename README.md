## stores

| Column           | Type    | Options     |
| ---------------- | ------  | ----------- |
| store_name       | string  | null: false |
| description      | text    |             |
| address          | text    | null: false |
| latitude         | float   | null: false |
| longitude        | float   | null: false |
| opening_hours    | string  | null: false |

### Association 
- has_many :items
- has_many :users


## users

| Column                | Type       | Options                        |
| --------------------- | ---------- | -----------------------------  |
| first_name            | string     | null: false                    |
| last_name             | string     | null: false                    |
| email                 | string     | null: false, unique: true      |
| encrypted_password    | string     | null: false                    |
| store                 | references | null: false, foreign_key: true |


### Association
- belongs_to :store


## items

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| size_id             | integer    | null: false                    |
| color               | integer    | null: false                    |
| price               | integer    | null: false                    |
| number_of_inventory | integer    | null: false                    |
| store               | references | null: false, foreign_key: true |


### Association
- belongs_to : store