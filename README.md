![ER図](https://user-images.githubusercontent.com/66255429/91723811-4ff25900-ebd7-11ea-9f20-70d941c8c1e6.png)

## users
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null:false, unique:true|
### Association
- has_one :profile
- has_one :address
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
|user_id|references|null:false,foreign_key:true|
### Association
- belongs_to :user


## credit_cards
|Column|Type|Options|
|------|----|-------|
|card_code|integer|null:false|
|security_id|string|null:false|
|exp|date|null:false|
user_id|references|null:false,foreign_key:true|
### Association
- belongs_to: user


## address
|Column|Type|Options|
|------|----|-------|
|address_family_name|string|null:false|
|address_first_name|string|null:false|
|address_family_name_kana|string|null:false|
|address_first_name_kana|string|null:false|
|post_code|integer|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|street_number|string|null:false|
|house_name|string|
|phone_number|integer|unique:true|
|user_id|references|null: false,foreign_key:true|
### Association
- belongs_to: user


## items
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|price|integer|null:false|
|brand|string|
|condition|string|null:false|
|postage|integer|null:false|
|until_shipping|integer|null:false|
|stock|string|null:false|
|category|references|null:false,foreign_key:true|
|seller_id|references|null:false,foreign_key:true|
|buyer_id|references|null:false,foreign_key:true|

### Association
- has_many :images
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to :brand


## images
|Column|Type|Options|
|------|----|-------|
|img|string|null:false|
|products_id|references|null:false,foreign_key:true|
### Association
- belongs_to :item


## comments
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|references|null:false,foreign_key:true|
|product_id|references|null:false,foreign_key:true|
### Association
- belongs_to :user
- belongs_to :item


## categories
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|ancestry|string||
### Association
- has_many :items


## brands
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
### Association
- has_many :items