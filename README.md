https://gyazo.com/347a3dbe54e58cc15cd72655ad0b28cf
ER図はこちらです

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
|birthday|date|null:false|

### Association
-has_many :items
-has_many :item_purchases


## items_table
|Column	|Type|	Options|
|-------|---|-----|
|user_id(FK) |integer|foreign_key: true|
|name|string|null:false|
|introduction|text|null:false|
|item_condition|integer|null:false|
|category|integer|null:false|
|price|integer|null:false|
|postage_payer|integer|null:false|
|shipment|integer|null:false|
|preparation_day|integer|null:false|


### Association
-belongs_to :users
-has_many :item_purchases


## item_purchases
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
|post_code|string|null:false|
|prefecture_code|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_number|string|
|phone_number|integer|null:false|


### Association
belongs_to :item_purchases
