module VideosHelper

  # 動画のURLを埋め込み用に変換
  def embed_url(video)
    video.url.gsub(%r{https://www.youtube.com/watch\?v=(\w+)}) { "https://www.youtube.com/embed/#{Regexp.last_match(1)}" }
  end
end
