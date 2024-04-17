# アプリケーション名
Try On

# アプリケーション概要
- 欲しいと思っていた服の試着可能店舗を商品名から検索して地図上で確認できるアプリ（消費者側アプリ）
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
## 店舗登録、商品登録（販売側）
1. テスト用アカウントでログインする。または、アカウント作成から新規登録。
2. 店舗一覧から「店舗を登録」を押下し、店舗登録画面で項目を入力する。
3. 緯度・経度の項目はGooglemapで任意の店舗を検索し、その上でマーカーを右クリックすると表示されるのでコピーしてそれぞれ入力し登録。
4. 商品一覧から「商品を登録」を押下し、商品登録画面で項目を入力する。（在庫数が3以下だとマップにマーカーが表示されません。）
5. 取り扱い店舗を選択して、商品と店舗の情報を紐付ける。

## 試着可能店舗を地図上で検索して確認（消費者側）
1. 検索ウィンドウに先ほど登録した商品名を入力。
2. 在庫が４以上であれば、先ほど紐付けた店舗のマーカーが地図上で確認できる。

# アプリケーションを作成した背景
昔から服や靴などを買う時に試着して素材やサイズ感などを確かめてから買いたいと思っていて、友人など何人かに確認したところほとんどの人が試着してから購入したいというインサイトがあった。さらに、試着しようという時点で買う確度高いと仮説をたて、ヒアリングに答えてくれた方はその通りだった。
上記から、お店にとっても試着したい方が無駄なく来店すれば、売り上げに貢献できるのではと考えた。
さらにアパレルで店長をやっていた方にヒアリングしたところ、地図上で他の店舗で試着できるかどうかの情報だけでもマーケティング戦略になるという意見を頂き、開発を決意。

# ターゲットユーザー・ペルソナ
[![Image from Gyazo](https://i.gyazo.com/1fa1ec518670052b40309e928b6d9d8a.png)](https://gyazo.com/1fa1ec518670052b40309e928b6d9d8a)
### 簡易ユーザージャーニー
※消費者側の試着可能店舗検索app
[![Image from Gyazo](https://i.gyazo.com/0a432ded7e09792ca4d5042adc3d088c.png)](https://gyazo.com/0a432ded7e09792ca4d5042adc3d088c)
# MVP要件(ペルソナ・ユーザージャーニー等を元に洗い出した)
[![Image from Gyazo](https://i.gyazo.com/743c4fbdc29f6b8a1e1ee35952c23f58.png)](https://gyazo.com/743c4fbdc29f6b8a1e1ee35952c23f58)

# UIデザイン（ラフスケッチ）
### ※初期構想のため追加実装と判断し、未実装の機能も含んでいます。
[![Image from Gyazo](https://i.gyazo.com/a79ecc1ad3c8d492aa7ab33689059ea7.png)](https://gyazo.com/a79ecc1ad3c8d492aa7ab33689059ea7)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/05fa2b6e2ad8e18180433b88d333370a.png)](https://gyazo.com/05fa2b6e2ad8e18180433b88d333370a)
# DB設計
[![Image from Gyazo](https://i.gyazo.com/57ce832738d0c28bd81277a6ec3fdef5.png)](https://gyazo.com/57ce832738d0c28bd81277a6ec3fdef5)

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


# メイン機能についての画像や動画
### 販売者側
- 在庫一覧（トップページ）
[![Image from Gyazo](https://i.gyazo.com/bd998a4ffc953f6cc99d4919a3b1603e.png)](https://gyazo.com/bd998a4ffc953f6cc99d4919a3b1603e)
- アカウント作成
トップページ → アカウント作成押下 → 下記ページ
[![Image from Gyazo](https://i.gyazo.com/77107f509d69389f99a6101a2d92d95b.gif)](https://gyazo.com/77107f509d69389f99a6101a2d92d95b)
- 店舗登録
トップページ → 店舗一覧 → 店舗を登録押下 → 下記ページ
[![Image from Gyazo](https://i.gyazo.com/4fb9aef7d6d8e4b6b5aff5037c2d621e.gif)](https://gyazo.com/4fb9aef7d6d8e4b6b5aff5037c2d621e)
- 商品登録
トップページ → 商品を登録押下 → 下記ページ
[![Image from Gyazo](https://i.gyazo.com/c11c2423790e5b269d615d0e8e448b10.gif)](https://gyazo.com/c11c2423790e5b269d615d0e8e448b10)
### 試着可能店舗検索app
[![Image from Gyazo](https://i.gyazo.com/393e8bf2c0d2dc265c6a03b51bcd7ff4.gif)](https://gyazo.com/393e8bf2c0d2dc265c6a03b51bcd7ff4)

# 追加実装検討中機能
消費者側
- 店舗情報をマーカーから確認できる機能
- 現在地許可機能
- ルート検索機能
- 検索機能改善（フィルターを実装し、精度をあげるなど）
- その他、在庫管理アプリやレジの在庫と連携できないか

販売側
- 商品を登録する際に店舗を自動で紐づける機能
- 登録情報追加
- 検索機能
- 管理者権限機能
- エンタプライズ企業向け想定の店舗管理機能(本社から管理？)
- csvインポート・エクスポート機能






# 開発環境
### フロントエンド
- HTML, CSS, JavaScript
- 非同期通信を活用
- Google Maps APIを利用した地図機能の統合
### バックエンド
- Ruby, Ruby on Rails 7.0.8.1
- 非同期通信を活用
- Google Maps APIとの連携
### データベース
- MySQL 5.7.44（開発環境）
- PostgreSQL（本番環境）
### データベース管理
- TablePlus
### ソース管理
- GitHub, GitHub Desktop
### デプロイ/運用
- Renderを使用したデプロイメント

# 受入テスト資料
[![Image from Gyazo](https://i.gyazo.com/5b1af082804897b9810fddae055354fb.png)](https://gyazo.com/5b1af082804897b9810fddae055354fb)

