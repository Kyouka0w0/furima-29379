https://gyazo.com/347a3dbe54e58cc15cd72655ad0b28cf
ER図はこちらです

## users_table
|Column	|Type|	Options|
|-------|---|-----|
|nickname|string|null:false|
|email|string|null:false,unipue:true|
|password|string|null:false|
|first_name|string|null:false|
|last_name|string|null:false|
|first_name_kana|string|null:false|
|last_name_kana|string|null:false|
|birthday|date|null:false|

### Association
-has_many :items
-has_many :order


## items_table
|Column	|Type|	Options|
|-------|---|-----|
|user_id(FK) |integer|foreign_key: true|
|name|string|null:false|
|introduction|text|null:false|
|item_condition_id|integer|null:false|
|category_id|integer|null:false|
|price|integer|null:false|
|postage_payer_id|integer|null:false|
|shipment_id|integer|null:false|
|preparation_day_id|integer|null:false|


### Association
-belongs_to :users
-has_one :order


## order
|Column	|Type|	Options|
|-------|---|-----|
|user_id(FK)|integer|foreign_key: true|
|item_id(FK)|integer|foreign_key: true|

### Association
-belongs_to :user
-belongs_to :item
-has_one :address


## address_table
|Column	|Type|	Options|
|-------|---|-----|
|order_id|integer|foreign_key: true|
|post_code|string|null:false|
|shipment_id|integer|null:false|
|city|string|null:false|
|house_number|string|null:false|
|building_number|string|
|phone_number|string|null:false|


### Association
belongs_to :order

以上