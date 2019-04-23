FactoryBot.define do
  factory :video do
    title { 'test_video_01' }
    content { 'testtesttest' }
    url { 'https://www.youtube.com/watch?v=T79RaXB2zdo' }
  end

  factory :second_video, class: Video do
    title { 'test_video_02' }
    content { 'testtest2' }
    url { 'https://www.youtube.com/watch?v=18cdgGnUhqU' }
  end

  factory :third_video, class: Video do
    title { 'test_video_03' }
    content { 'testtest3' }
    url { 'https://www.youtube.com/watch?v=rmvpnCY_FYQ' }
  end

  factory :fourth_video, class: Video do
    title { 'test_video_04' }
    content { 'testtest4' }
    url { 'https://www.youtube.com/watch?v=S9qp7QMCabM' }
  end
end
