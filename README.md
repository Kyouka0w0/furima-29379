https://gyazo.com/18a9dfa2057036dc02b6a29952ef8efd
プルリクエストに添付できなかったER図こちらに貼らせていただきます。

## users_table
|Column	|Type|	Options|
|-------|---|-----|
|nickname|string|null:false|
|email|string|null:false,unipue:true|
|password|string|null:false|
|first_name|string|null:false|
|family_name|string|null:false|
|first_name_kana|string|null:false|
|family_name_kana|string|null:false|
|birth_year|date|null:false|
|birth_month|date|null:false|
|birth_day|date|null:false|

### Association
-has_many :items
-has_many :check
-has_many :items, through: :check


## items_table
|Column	|Type|	Options|
|-------|---|-----|
|user_id(FK) |integer|foreign_key: true|
|item_name|string|null:false|
|introduction|text|null:false|
|item_condition|references|null:false,foreign_key:true|
|category|references|null:false,foreign_key:true|
|price|integer|null:false|
|item_imgs|string|null:false|

### Association
-belongs_to :users
-has_many :check
-has_many :users, through: :check


## check_table（中間テーブル）
|Column	|Type|	Options|
|-------|---|-----|
|user_id(FK)|integer|foreign_key: true|
|item_id(FK)|integer|foreign_key: true|

### Association
-belongs_to :users
-belongs_to :items
-has_one :address


## address_table
|Column	|Type|	Options|
|-------|---|-----|
|check_id|integer|foreign_key: true|
|post_code|integer(7)|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_number|string|null:false|
|phone_number|integer|null:false|
|card_number|integer|null:false|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|secrity_code|integer|null:false|

### Association
belongs_to :check

