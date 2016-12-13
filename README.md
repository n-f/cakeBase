## 目的

使い回し可能LAMP環境構築(cake3)

## 使い方

1. 本レポジトリをcloneする

2. cloneしたディレクトリに移動して以下コマンドを実行する

```
vagrant up
```

## 構築内容

### LAMP

* CentOS7.2
* PHP7
* mariadb
* Apache2.4

### URL

ルート

```
http://192.168.33.10
```

CakePHP3

```
http://192.168.33.10/app
```

## mariadbセットアップ
以下のコマンドを実行してセットアップする
```
sudo mysql_secure_installation
```

## マイグレーション
DB設定後に以下コマンドを実行
```
bin/cake migrations migrate
```
##備考メモ

mariadbのセットアップで初期化(rootユーザーとそのパスワードの設定など)した後に、
databaseの作成等を行い、
app/database.php .defaultからコピー後、
db名、ユーザー(rootならroot)、パスを、加える必要がある。

また、.gitigoreにより、database.phpは、コミットできなくなっている。
