# Lit Tube
## 概要
YouTubeは今や誰もが知っている動画共有サイトですが、サイトが巨大になりすぎて、埋もれている素晴らしい動画が実はたくさんあります。LitTUBEはあなたの周りの友達や家族など小さなコミュニティーでオススメのYouTube動画を共有することでYouTubeだけでは見つけられなかったすばらしい動画を発見することを目的としています。
## コンセプト
YouTubeだけで見つけられなかった有益な動画の発掘
## バージョン
Ruby 2.6.1 Rails 5.2.3
## 機能一覧
### ユーザー機能
+ ログイン機能
+ Oauthログイン機能
○ Googleアカウントでの登録
+ フォローフォロワー機能
+ パスワード再設定機能
### 動画投稿機能
+ youtube動画の投稿
○ 任意のYouTube動画を投稿できる
○ 投稿の編集、削除ができる
+ コメント機能
○ 投稿されている動画にコメントができる
+ いいね機能
○ 投稿されている動画にコメントができる
+ 動画検索機能
○ タイトルで動画を検索できる
○ カテゴリーで動画を検索できる
+ 動画並び替え機能
○ 新着順で動画を並び替えることができる
○ 人気順で動画を並び替えることができる
## カタログ設計/テーブル定義
https://docs.google.com/spreadsheets/d/1dspoiBATLqBsd1QHXva7dBNUifcVl8AEQ3AXk_k1nXA/edit?usp=sharing
## 画面遷移図/ワイヤーフレーム
https://docs.google.com/spreadsheets/d/101TvCII4AhHzM8b-yviuDSTmcxbcXc8C2jm7jbQmjfA/edit?usp=sharing
## 使用予定Gem
+ devise
+ googleauth
+ acts-as-taggable-on
+ ransack
+ counter culuture
+ carrierwave
+ minimagick
+ kaminari
+ rubocop