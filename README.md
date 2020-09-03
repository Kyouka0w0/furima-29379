設計　https://gyazo.com/17639e7faee41ca7c98a6e37e7b3398c

usersテーブル　
必要カラム
・id
・nickname
・email
・password
・hullname
・birthday
アソシエーション(users)
・has_many :item
・has_one :cash

itemsテーブル
必要カラム
・id
・user_id
・item_name
・price
・category
アソシエーション(items)
・belongs_to :users
・has_one :cash

checkテーブル
必要カラム
・id
・user_id
・item_id
アソシエーション(cash)
・belongs_to :users
・belongs_to :items
・has_one :address

addressテーブル
必要カラム
・id
・check_id
・address
アソシエーション
・belongs_to :check
