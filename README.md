https://gyazo.com/5fa448c91180ee1fe99a5a53c3596d86

データベース設計

userモデルを作成 
deviseを使用しログイン・新規登録 ニックネーム、メールアドレス、パスワード、個人情報（氏名・生年月日）管理

itemモデル作成（商品） 
userが出品した商品を登録する。（pictweetでいうツイート）
画面 商品名、カテゴリー、値段、出品者を管理。 user_idでそれぞれどのuserが出品したのかを紐付けする。 
売れたら売り切れ表示にしてあげないといけない。

cash（購入） 
ここでどのuserが出したどの商品が売れたのかを紐付けする必要がある。 
よって、user_id,item_idで関連付けて次へ進む

address（実質購入） 
配送先を入力しカードで支払いを終える。 
この工程はトランザクションで購入（支払い）と配送がセットで１つとしなくてはいけない。
