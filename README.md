# アプリケーション名
Try On

# アプリケーション概要
- 欲しい思っていた服の試着可能店舗を地図上で確認できるアプリ（消費者側アプリ）
- 在庫管理アプリ（販売側アプリ）

# URL
- 消費者側アプリ：https://try-on.onrender.com/tryonforclient/inde
- 販売側アプリ：https://try-on.onrender.com/

# 在庫管理アプリテスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：8888

テスト用アカウント
- Eメール：test@test.com
- パスワード：000000

※現状、消費者側の試着店舗確認アプリではアカウント登録なしで利用できることを想定しています。

# 利用方法
## 店舗登録、商品登録
1. テスト用アカウントでログインする。または、アカウント作成から新規登録。
2. 店舗一覧から「店舗を登録」を押下し、店舗登録画面で項目を入力する。
3. 緯度・経度の項目はGooglemapで任意の店舗を検索し、その上でマーカーを右クリックすると表示されるのでコピーしてそれぞれ入力し登録。
4. 商品一覧から「商品を登録」を押下し、商品登録画面で項目を入力する。（在庫数が3以下だとマップにマーカーが表示されません。）
5. 取り扱い店舗を選択して、商品と店舗の情報を紐付ける。

## 試着可能店舗を地上で検索して確認
1. 検索ウィンドウに先ほど登録した商品名を入力。
2. 在庫が４以上であれば、先ほど紐付けた店舗のマーカーが地図上で確認できる。

# アプリケーションを作成した背景
昔から服や靴などを買う時に試着して素材やサイズ感などを確かめてから買いたいと思っていて、友人など何人かに確認したところほとんどの人が試着してから購入したいというインサイトがあった。さらに、試着しようという時点で買う確度高いと仮説をたて、ヒアリングに答えてくれた方はその通りだった。
上記から、お店にとっても試着したい方が無駄なく来店すれば、売り上げに貢献できるのではと考えた。
さらにアパレルで店長をやっていた方にヒアリングしたところ、地図上で他の店舗で試着できるかどうかの情報だけでもマーケティング戦略になるという意見を頂き、開発を決意。

# ターゲットユーザー・ペルソナ
[![Image from Gyazo](https://i.gyazo.com/1fa1ec518670052b40309e928b6d9d8a.png)](https://gyazo.com/1fa1ec518670052b40309e928b6d9d8a)
### 簡易ユーザージャーニー
[![Image from Gyazo](https://i.gyazo.com/0a432ded7e09792ca4d5042adc3d088c.png)](https://gyazo.com/0a432ded7e09792ca4d5042adc3d088c)
# ペルソナを元に洗い出したMVP要件
[![Image from Gyazo](https://i.gyazo.com/743c4fbdc29f6b8a1e1ee35952c23f58.png)](https://gyazo.com/743c4fbdc29f6b8a1e1ee35952c23f58)
# DB設計
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