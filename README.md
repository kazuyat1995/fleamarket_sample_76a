<img width="1525" alt="ER図" src="https://user-images.githubusercontent.com/66734345/89371944-bfcc0b80-d71f-11ea-9810-c460367d4362.png">

## users

| Column   | Type   | Options                 |
| -------- | ------ | ----------------------- |
| nickname | string | null: false             |
| password | string | null: false             |
| email    | string | null:false, unique:true |

### Association

- has_one :profile
- has_one :address
- has_many :credit_cards
- has_many :items
- has_many :comments

## profiles

| Column           | Type       | Options                     |
| ---------------- | ---------- | --------------------------- |
| first_name       | string     | null:false                  |
| family_name      | string     | null:false                  |
| first_name_kana  | string     | null:false                  |
| family_name_kana | string     | null:false                  |
| birthday         | date       | null:false                  |
| phone_number     | integer    | unique:true                 |
| user_id          | references | null:false,foreign_key:true |

### Association

- belongs_to :user

## cards

| Column      | Type       | Options                     |
| ----------- | ---------- | --------------------------- |
| customer_id | string     | null:false                  |
| card_id     | string     | null:false                  |
| user_id     | references | null:false,foreign_key:true |

### Association

- belongs_to: user

## address

| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| post_code     | integer    | null:false                   |
| prefecture    | string     | null:false                   |
| city          | string     | null:false                   |
| street_number | string     | null:false                   |
| house_name    | string     |                              |
| user_id       | references | null: false,foreign_key:true |

### Association

- belongs_to: user

## items

| Column    | Type       | Options                     |
| --------- | ---------- | --------------------------- |
| name      | string     | null:false                  |
| detail    | text       | null:false                  |
| price     | integer    | null:false                  |
| condition | string     | null:false                  |
| category  | references | null:false,foreign_key:true |
| brand     | references | null:false,foreign_key:true |
| postage   | integer    | null:false                  |

### Association

- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to :brand

## images

| Column      | Type       | Options                     |
| ----------- | ---------- | --------------------------- |
| img         | string     | null:false                  |
| products_id | references | null:false,foreign_key:true |

### Association

- belongs_to :item

## comments

| Column     | Type       | Options                     |
| ---------- | ---------- | --------------------------- |
| comment    | text       | null:false                  |
| user_id    | references | null:false,foreign_key:true |
| product_id | references | null:false,foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item

## categories

| Column   | Type   | Options    |
| -------- | ------ | ---------- |
| name     | string | null:false |
| ancestry | string |            |

### Association

- has_many :items

## brands

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association

- has_many :items
