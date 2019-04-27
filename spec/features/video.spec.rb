require 'rails_helper'
require 'date'

RSpec.feature '動画機能', type: :feature do
  describe '一覧表示機能' do
    background do
      user_1 = FactoryBot.create(:user)
      user_2 = FactoryBot.create(:user2)
      user_3 = FactoryBot.create(:user3)
      user_4 = FactoryBot.create(:user4)
      FactoryBot.create(:video, user: user_1)
      FactoryBot.create(:second_video, user: user_2)
      FactoryBot.create(:third_video, user: user_3)
      FactoryBot.create(:fourth_video, user: user_4)
    end
    context 'ユーザー１がログインしている時' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'user1@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'Log in'
        visit videos_path
      end

      scenario 'ユーザー１でログインしているときに名前が表示されるかテスト' do
        visit videos_path
        expect(page).to have_content 'テストユーザー1のページ'
      end

      scenario '動画作成のテスト' do
        visit new_video_path
        fill_in 'video_title', with: 'テストタイトル'
        fill_in 'video[content]', with: 'テストコンテント'
        fill_in 'video[url]', with: 'https://www.youtube.com/watch?v=ffyYxu1rPi8'
        click_on '登録する'
        expect(page).to have_content 'テストタイトル'
        expect(page).to have_content 'テストコンテント'
      end
    end
    context '動画のソート、検索' do
      scenario '新着順の動画ソートのテスト' do
        visit videos_path
        click_link '新着順'
        expect(Video.order('created_at ASC').map(&:title)).to eq %w[test_video_01 test_video_02 test_video_03 test_video_04]
      end
      scenario 'タイトル検索のテスト' do
        visit videos_path
        fill_in 'q_title_or_content_or_user_name_cont', with: 'test_video_01'
        click_on '検索'
        expect(page).to have_content 'test_video_01'
      end
      scenario '内容検索のテスト' do
        visit videos_path
        fill_in 'q_title_or_content_or_user_name_cont', with: 'testtest2'
        click_on '検索'
        expect(page).to have_content 'testtest2'
      end
      scenario '投稿者検索のテスト' do
        visit videos_path
        fill_in 'q_title_or_content_or_user_name_cont', with: 'テストユーザー2'
        click_on '検索'
        expect(page).to have_content 'test_video_02'
      end
    end
  end
end
