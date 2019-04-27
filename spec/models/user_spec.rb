require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'factory_botの検証' do
    it 'factory_botが有効かどうかの検査' do
      user = @user
      expect(user).to be_valid
    end
  end

  it '名前、メールアドレス、パスワードがあれば有効な状態であること' do
    user = @user
    expect(user).to be_valid
  end
  it '名前が空だとバリデーションが通らない' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end
  it '重複したメールアドレスだとバリデーションが通らない' do
    user = FactoryBot.build(:user, email: 'user1@example.com')
    expect(user).not_to be_valid
  end
  it '名前が31文字以上だとバリデーションが通らない' do
    user = FactoryBot.build(:user, name: 'a' * 31)
    expect(user).not_to be_valid
  end
  it 'パスワードが5文字以下だとバリデーションが通らない' do
    user = FactoryBot.build(:user, password: '1234')
    expect(user).not_to be_valid
  end
  it 'メールアドレスの書式が不正だとバリデーションが通らない' do
    user = FactoryBot.build(:user, email: 'test')
    expect(user).not_to be_valid
  end
end
