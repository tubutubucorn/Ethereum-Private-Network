#!/bin/bash

# Ubuntu 18.04

# パッケージインデックスの更新
apt update && apt upgrade -y

# 前提ソフトウェアのインストール
apt install -y apt-transport-https ca-certificates curl software-properties-common python

# GPG 公開鍵のインストール
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# aptリポジトリの設定
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# docker-ceのインストール
apt update && apt install -y docker-ce
# 一般ユーザでの実行
usermod -aG docker $(whoami)


docker network create ETH

docker build -t node_one .

docker build -t node_two .

docker run --rm -itd -p 8545:8545 --net=ETH node_one

docker run --rm -itd -p 8546:8546 --net=ETH node_two

cd ..
