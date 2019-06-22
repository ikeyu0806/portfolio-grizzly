# Grizzly

Grizzlyはマークダウン記法に対応した記事投稿サービスです。

以下の機能を実装しています。

- 記事投稿、編集、削除機能

- ユーザ作成機能

- フォロー、アンフォロー機能

- 気に入った記事へのいいね機能

- 記事へのコメント機能

- Ansibleによるデプロイ環境構築

- Capistranoによる自動デプロイ

## 開発環境の構築

git clone

```

git clone git@github.com:ikeyu0806/grizzly.git
```

必要なgemのインストール

```

bundle install --path vendor/bundle
```

マイグレーション

```

bundle exec rails db:migrate
```

javascriptパッケージのインストール

```

yarn install
```

サーバ起動

```

bundle exec guard
```

## 本番環境の構築

Ansibleでのプロビジョニング

```
cd ansible_vagrant/ansible

ansible-playbook --list-tasks site.yml -i hosts

ansible-playbook --list-hosts site.yml -i hosts

ansible-playbook -vvv site.yml -i hosts
```

以下のファイルはgitの管理対象外のため手動で設置する必要あり

```

ansible_vagrant/ansible/roles/os-setting/templates/authorized_keys

ansible_vagrant/ansible/roles/os-setting/templates/id_rsa

ansible_vagrant/ansible/roles/capistrano/templates/master.key
```

デプロイ

```

bundle exec cap prouction deploy
```
