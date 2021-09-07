# toretomo  
『toretomo』は市民アスリートが簡単に練習パートナー見つけられるマッチングアプリです！  
基本機能はログイン無しで閲覧可能ですのでお気軽にご覧下さい。(ゲストログインも用意しています！)
  
### リンク: <a href="https://toretomo.jp">toretomoを触ってみる
  
### トップページ
  ![localhost_8080_](https://user-images.githubusercontent.com/55049751/132280926-32586549-741f-46aa-a1aa-41d7de1c6c43.png)
  
  
# 特に見て頂きたい点
- インフラ  
  - Dockerを使い、ECS(FARGATE)/ECRで本番環境をサーバーレスで運用している点。  
  - AWSを使い、ALBを通すことで常時SSL通信を行っている点。  
  - CircleCIを使い、CD/CDパイプラインを構築している点。  
- バックエンド面  
  - Ruby on RailsのAPIモードを利用し、APIサーバーとしてフロントエンドからのリクエストに対してJSONデータを返している点  
  - トークン認証を利用したログインを実装してる点。  
- フロントエンド面  
  - Nuxt.jsを採用し、SPA（シングルページアプリケーション）で配信している点。  
  - UIフレームワークにVuetifyを使用し、整ったUIを意識している点  
- その他  
  - フロント側ではESLint/Prettier、バック側でrubcopといったコード解析ツールを採用し  
  - 読みやすいコードを意識している点  
  - チーム開発を意識し、issueやブランチを活用した開発手法を取り入れている点。  

# 使用した技術
- フロントエンド
  - HTML/CSS
  - Javascript
  - Nuxt.js（SPAモード）
  - Vuetify（UIフレームワーク）
  - Jest（テスト）
  - ESLint/Prettier（コード解析ツール）
- バックエンド
  - Ruby 2.7.1
  - Ruby on Rails 6.0.3 （APIモード）
  - Rubocop（コード解析ツール）
  - RSpec（テスト）
- インフラ・開発環境
  - Docker/Docker-compose
  - AWS（ECR,ECS,VPC,S3,Route53,ALB,RDS,ACM,SSM）
  - CircleCI（CI/CD）

# ER図
![20210715_toretomo_ER図 drawio](https://user-images.githubusercontent.com/55049751/132281842-46c7c325-9c84-45b8-87a6-d3f56cc505cd.png)  
  
  
# インフラ構成図
![名称未設定ファイル drawio](https://user-images.githubusercontent.com/55049751/132280149-3afc38c1-b582-4916-b740-adf199671fab.png)
  
# 機能一覧
- 基本機能
  - 新規会員登録・ログイン機能
  - ユーザーマイページ表示（投稿した練習プラン・参加中練習プラン・フォロー・フォロワー表示）
  - 練習プラン一覧閲覧
  - 練習プラン詳細情報ページ
  - 練習プランへの参加者一覧
  - 練習プラン詳細情報ダイアログ表示機能
  - ソート機能（種目・場所から絞り込み）
- ログイン後機能  
  - ユーザーフォロー機能
  - ユーザープロフィール更新機能(アイコン、名前、生年月日、性別)
  - 練習プラン編集、削除機能
  - 練習プランへの参加機能
  - トークスペースでのメッセージ送信機能

