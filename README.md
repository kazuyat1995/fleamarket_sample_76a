## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null:false, unique:true|
### Association
- has_one :profile
- has_one :adress
- has_many :credit_cards
- has_many :items
- has_many :comments


## profiles
|Column|Type|Options|
|------|----|-------|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birthday|date|null:false|
|phone_number|integer|unique:true|
|user_id|references|null:false,foreign_key:true|
### Association
- belongs_to :user


## credit_cards
|Column|Type|Options|
|------|----|-------|
|card_code|string|null:false|
|security_id|string|null:false|
|exp|date|null:false|
### Association
- belongs_to: user


## adress
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|street_number|string|null:false|
|house_name|string||
|user_id|references|null: false,foreign_key:true|
### Association
- belongs_to: user


## items
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|price|integer|null:false|
|condition|string|null:false|
|postage|integer|null:false|
|category_id|references|null:false,foreign_key:true|
|brand_id|references|null:false,foreign_key:true|
### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :category, through: :brand_categories
- belongs_to :brand, through: :brand_categories


## images
|Column|Type|Options|
|------|----|-------|
|img|string|null:false|
|item_id|references|null:false,foreign_key:true|
### Association
- belongs_to :products


## comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|references|null:false,foreign_key:true|
|item_id|references|null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :item

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :items
- has_many :brand_categories
- has_many :brand, through: :brand_categories


## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :items
- has_many :brand_categories
- has_many :category, through: :brand_categories


## brand_categories
|column|Type|Option|
|------|----|------|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
### Association
- belongs_to :category
- belongs_to :brand

