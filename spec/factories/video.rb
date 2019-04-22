FactoryBot.define do
  factory :video do
    title { 'test_video_01' }
    content { 'testtesttest' }
    url { 'https://www.youtube.com/watch?v=T79RaXB2zdo' }
  end

  factory :second_video, class: Video do
    title { 'test_video_02' }
    content { 'samplesample' }
    url { 'https://www.youtube.com/watch?v=18cdgGnUhqU' }
  end

  factory :third_video, class: Video do
    title { 'test_video_03' }
    content { 'samplesample' }
    url { 'https://www.youtube.com/watch?v=rmvpnCY_FYQ' }
  end

  factory :fourth_video, class: Video do
    title { 'test_video_04' }
    content { 'samplesample' }
    url { 'https://www.youtube.com/watch?v=S9qp7QMCabM' }
  end

  factory :user_video, class: Video do
    title { 'ログインテスト' }
    content { 'テスト' }
  end
end
