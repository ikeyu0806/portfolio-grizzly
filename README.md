# Grizzly

Grizzlyはマークダウン記法に対応した記事投稿サービスです。以下の機能を実装しています。

- 記事投稿、編集、削除機能

- ユーザ作成機能

- フォロー、アンフォロー機能

- 気に入った記事へのいいね機能

- 記事へのコメント機能

- Ansibleによるデプロイ環境構築

- Capistranoによる自動デプロイ

## 開発環境の構築

```

git clone git@github.com:ikeyu0806/grizzly.git
```

```

bundle install --path vendor/bundle
```

```

bundle exec rails db:migrate
```

```

yarn install
```

```

bundle exec guard
```

## 本番環境の構築

```

ansible-playbook --list-tasks -i production -l [対象サーバ名] ansible_vagrant/ansible/site.yml
ansible-playbook --list-hosts -i production -l [対象サーバ名] ansible_vagrant/ansible/site.yml
ansible-playbook -vvv -i production -l [対象サーバ名] ansible_vagrant/ansible/site.yml
```

### デプロイ

```

bundle exec cap prouction deploy
```