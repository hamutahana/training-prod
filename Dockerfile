# ベースとして使用するイメージ名（DockerHubからダウンロードされる）
FROM ruby:3.2.2-alpine

# 本番環境にアップロードする時のみコメントアウトを外す
# ENV RAILS_ENV=production

# 利用可能なパッケージのリストを更新してインストールする
RUN apk update \
  && apk add g++ make mysql-dev tzdata vim

# コンテナを起動した時の作業ディレクトリを/appにする
WORKDIR /app

COPY . .

# bundle installでGemfileに記述されているgemをインストール
RUN bundle install

CMD ["sh", "/app/start.sh"]
