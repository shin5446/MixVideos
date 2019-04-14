require 'rails_helper'

RSpec.describe Video, type: :model do

  user = User.create!(name: 'テスト太郎', email: 'foo@example.com', password: 'password')

  it "titleが空ならバリデーションが通らない" do
    video = user.videos.build(title: '', content: '失敗テスト')
    expect(video).not_to be_valid
  end

  it "contentが空ならバリデーションが通らない" do
    video = user.videos.build(title: '失敗テスト', content: '')
    expect(video).not_to be_valid
  end

  it "titleとcontentに内容が記載されていればバリデーションが通る" do
    video = user.videos.build(title: '失敗テスト', content: '失敗テスト', url: 'https://www.youtube.com/watch?v=rjgtvXriof0')
    expect(video).to be_valid
  end
end
