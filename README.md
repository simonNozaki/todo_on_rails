# todo_on_rails

簡素なTODOアプリバックエンド on rails。

# 機能要件
## 機能概要
TODOアプリケーションの、バックエンド機能を提供するREST API。やることを示す *TODO* を中心に、
ネストしたTODOオブジェクトである *サブTODO* の登録も可能。 サブTODOは親のTODOに依存した構造になっており、ステータス遷移や登録において制約を受ける。

## ユースケース、ドメインモデル
![usecase](docs/)

# システム要件
* Ruby version
```bash
$ ruby -v
ruby 2.6.10p210 (2022-04-12 revision 67958) [x86_64-darwin20]
```

```bash
$ rails -v
Rails 6.1.7
```

# アプリケーションブループリント
デフォルトのapp配下ディレクトリに、ドメインオブジェクト（POROの集まり）を拡張することでドメインオブジェクトを表現、扱えるようにする。

ユースケース以下ドメインオブジェクトはドメイン層で完結するような構成にする。
そのため、コントローラはJSONシリアライズ・デシリアライズのみを司るプレゼンテーション層、Modelにはロジックをかかずデータオブジェクト・薄いORMとして扱う。

# 環境構築
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
