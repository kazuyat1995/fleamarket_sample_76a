アプリケーション情報

 　アプリケーション概要
 
  　　接続先情報
  
   　　　URL http://54.248.166.171/
   
  　　　 ID/Pass
   
  　　　  ID: tech76a
   
 　　　   Pass: fms76a
   
 テスト用アカウント等
 
  　　購入者用
  
   　　　メールアドレス: buyer@test.com
   
   　　　パスワード: buy0000
   
  　　購入用カード情報
    
  　　　 番号： 4242424242424242
      
  　　　 期限： 12/2030
      
  　　　 セキュリティコード：123
   
  　　出品者用
    
   　　　メールアドレス名: seller@test.com
      
  　　　 パスワード: sell0000
      
  開発状況
  
       開発環境
       
        Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
        
       開発体制
       
        人数：3人
        
        アジャイル型開発（スクラム）


      

![ER図](https://user-images.githubusercontent.com/66255429/92296867-3f920380-ef74-11ea-9401-ac388369368e.png)

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

| Column                   | Type       | Options                      |
| ------------------------ | ---------- | ---------------------------- |
| address_family_name      | string     | null:false                   |
| address_first_name       | string     | null:false                   |
| address_family_name_kana | string     | null:false                   |
| address_first_name_kana  | string     | null:false                   |
| post_code                | integer    | null:false                   |
| prefecture               | string     | null:false                   |
| city                     | string     | null:false                   |
| street_number            | string     | null:false                   |
| house_name               | string     |
| phone_number             | integer    | unique:true                  |
| user_id                  | references | null: false,foreign_key:true |

### Association

- belongs_to: user

## items
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null:false|
|category_id|references|null:false,foreign_key:true|
|brand|string|
|condition|string|null:false|
|postage|integer|null:false|
|until_shipping|string|null:false|
|price|integer|null:false|
|stock|
|seller_id|references|null: false,foreign_key:true|
|buyer_id|references|null: false,foreign_key:true|

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
