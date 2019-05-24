lock '3.6.0'

# デプロイするアプリケーション名
set :application, 'MixVideos'

# cloneするgitのレポジトリ（xxxxxxxx：ユーザ名、yyyyyyyy：アプリケーション名）
set :repo_url, 'https://github.com/shin5446/MixVideos'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, ENV['BRANCH'] || 'develop'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/MixVideos'

# シンボリックリンクをはるフォルダ・ファイル
set :linked_files, %w{.env config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

# 保持するバージョンの個数(※後述)
set :keep_releases, 5

# Rubyのバージョン
set :rbenv_ruby, '2.6.1'
set :rbenv_type, :system

#出力するログのレベル。エラーログを詳細に見たい場合は :debug に設定する。
#本番環境用のものであれば、 :info程度が普通。ただし挙動をしっかり確認したいのであれば :debug に設定する。
set :log_level, :debug

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, 'config/database.yml', 'config/secrets.yml'

# Default value for linked_dirs is []
# append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  GOOGLE_APP_ID: ENV["GOOGLE_APP_ID"],
  GOOGLE_APP_SECRET: ENV["GOOGLE_APP_SECRET"],
  SENDGRID_PASSWORD: ENV["SENDGRID_PASSWORD"],
  SENDGRID_USERNAME: ENV["SENDGRID_USERNAME"],
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}

# Default value for keep_releases is 5
# set :keep_releases, 5