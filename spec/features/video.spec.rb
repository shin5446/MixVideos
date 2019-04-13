require 'rails_helper'
require 'date'

RSpec.feature '動画機能', type: :feature do
  describe '一覧表示機能' do
    background do
      # 一般ユーザー1の作成
      FactoryBot.create(:user)
    end
    context 'ユーザー１がログインしている時' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'user1@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'Log in'
      end

      scenario 'ユーザー１でログインしているときに名前が表示されるかテスト' do
        visit videos_path
        expect(page).to have_content 'テストユーザーのページ'
      end

      scenario '動画作成のテスト' do
        visit new_video_path
        fill_in 'video_title', with: 'あああ'
        fill_in 'video[content]', with: 'いいい'
        click_on '登録する'
        expect(page).to have_content 'あああ'
        expect(page).to have_content 'いいい'
      end
    end
  end
end
