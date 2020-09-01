# dokoiku
![image](https://user-images.githubusercontent.com/64732255/89727884-a00c4e80-da63-11ea-84b7-4c818b572f23.png)


## サイト概要
『dokoiku』というサイトは家族やカップル、１人旅でもその日の予定は空けているけれど、実際にどこにいくかは決められていない人に向けたサイトです。このサイトではユーザー同士がお出かけをしたプランをシェアすることで、行ってみたい！と思えるものが見つかります。

### サイトテーマ
お出かけプランの選定

### テーマを選んだ理由
私自身、出かけることが好きなのですが、しっかり下調べをしてから行こうとするときはあらゆるサイトから情報を探してくることが大変でした。また一人で出かけるのではなく、友人や家族といく場合にはより詳細な下調べが必要だと感じました。そんな時に、既に誰かが行ったことのあるプランを投稿しユーザー間でシェアできれば、 プランの詳細や周辺情報、使った交通手段まで網羅できるなと考えたからです。

### ターゲットユーザ
10代から40代

### 主な利用シーン
出かける前、出かけている時、出かけた後

## 使用技術

### 使用言語

・Ruby 2.5.7  
・Rails 5.2.4.3  
・Javascript(jQuery)  

### 開発環境

Vagrant + VirtualBox

### インフラ

・AWS(VPC, EC2, RDS, CloudWatch, Route53)  
・MySQL2  
・Nginx(Webサーバ)  

### その他の技術(gem等)

・pry-byebug  
・dotenv-rails  
・devise  
・kaminari  
・bootstrap5  
・refile / refile-mini_magick  
・ransack  

### 主な機能
・ユーザー登録機能  
　新規登録、ログイン、ログアウト  
　プロフィールの編集  
・プランの投稿機能  
　新規投稿  
　プランの編集、削除  
・コメント機能  
　新規投稿  
　コメントの削除  
　コメントのもっと見るボタン(非同期通信)  
・カテゴリー機能  
　カテゴリーの追加  
　カテゴリーの編集、削除  
・プランに対するいいね機能(非同期通信)  
・フォロー機能(非同期通信)  
・いいねランキング機能  
・検索機能  
　ユーザー検索  
　プラン検索  


## 設計書
https://docs.google.com/spreadsheets/d/1Qj0jbzDfBEpLUkR1R7Sy717zejsw02h_nVagqx2uRW4/edit?usp=sharing


### 機能一覧
https://docs.google.com/spreadsheets/d/1Wx5Ym64v4Lun0f-BLKOSz3KVAtX7vODP9OwhSn5YfFw/edit#gid=0
