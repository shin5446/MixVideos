FactoryBot.define do
  factory :video do
    title { 'test_video_01' }
    content { 'testtesttest' }
  end

  factory :second_video, class: Video do
    title { 'test_video_02' }
    content { 'samplesample' }
  end

  factory :third_video, class: Video do
    title { 'test_video_03' }
    content { 'samplesample' }
  end

  factory :fourth_video, class: Video do
    title { 'test_video_04' }
    content { 'samplesample' }
  end

  factory :user_video, class: Video do
    title { 'ログインテスト' }
    content { 'テスト' }
  end
end
