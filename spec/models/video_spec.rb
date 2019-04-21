require 'rails_helper'

RSpec.describe Video, type: :model do
  user = User.create!(name: 'テスト太郎', email: 'foo@example.com', password: 'password')

  it 'titleが空ならバリデーションが通らない' do
    video = user.videos.build(title: '', content: '失敗テスト')
    expect(video).not_to be_valid
  end

  it 'contentが空ならバリデーションが通らない' do
    video = user.videos.build(title: '失敗テスト', content: '')
    expect(video).not_to be_valid
  end

  it 'titleとcontentに内容が記載されていればバリデーションが通る' do
    video = user.videos.build(title: '失敗テスト', content: '失敗テスト', url: 'https://www.youtube.com/watch?v=rjgtvXriof0')
    expect(video).to be_valid
  end

  it 'titleが１０1文字以上ならバリデーションが通らない' do
    video = user.videos.build(title: 'a' * 101, content: 'テスト', url: 'https://www.youtube.com/watch?v=rjgtvXriof0')
    expect(video).not_to be_valid
  end

  it 'youtube以外のURLだとバリデーションが通らない' do
    video = user.videos.build(title: 'テスト', content: 'テスト', url: 'https://www.nicovideo.jp/watch/sm34993895')
    expect(video).not_to be_valid
  end
end
