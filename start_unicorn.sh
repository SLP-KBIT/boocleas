#!/bin/sh

(
  script_file_path=`readlink -f $0`;
  rails_dir=`dirname $script_file_path`
  cd $rails_dir
  bundle exec unicorn_rails -c config/unicorn.rb -E production --path /App/BookAdmin/BoocLeas -D
)
