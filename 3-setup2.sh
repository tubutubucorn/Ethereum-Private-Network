#!/bin/bash

# Nodebrewインストール
curl -L git.io/nodebrew | perl - setup
# PATH通す
echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile
# 使用するNode.js(npm)のバージョン指定
nodebrew install-binary v8.9.4 && nodebrew use v8.9.4

# Rubyインストール
# Rubyのインストールに関連する各種ソフトウェアをインストール①
apt install -y git gcc build-essential libreadline-dev zlib1g-dev libssl-dev
# rbenvをインストール
# → gitでプログラムを取得してパスを設定
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
# ruby-buildをインストール
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# Rubyをインストール
rbenv install 2.4.1
rbenv global 2.4.1

cd node_client/
node install
node index.js
cd ..

cd ruby_client
bundle install
ruby client.rb
cd ..
