module VideosHelper
  # 動画のURLを埋め込み用に変換
  def embed_url(video)
    if video.url.include?("youtube")
      video.url.gsub(%r{https://www.youtube.com/watch\?v=(\w+)}) { "https://www.youtube.com/embed/#{Regexp.last_match(1)}" }
    elsif video.url.include?("nicovideo")
      video.url.gsub(%r{https?://?www.nicovideo.jp/watch}) { "https://embed.nicovideo.jp/watch#{Regexp.last_match(1)}" }
    elsif video.url.include?("dailymotion")
      video.url.gsub(%r{https?://?www.dailymotion.com/video}) { "https://www.dailymotion.com/embed/video#{Regexp.last_match(1)}" }
    elsif video.url.include?("pandora")
      video.url.gsub(%r{(?=#)(?:.*)}) { "embed" }
    elsif video.url.include?("vimeo")
      video.url.gsub(%r{https?://?vimeo.com}) { "https://player.vimeo.com/video#{Regexp.last_match(1)}" }
    elsif video.url.include?("rutube")
      video.url.gsub(%r{https?://?rutube.ru/video}) { "https://rutube.ru/play/embed/#{Regexp.last_match(1)}" }
    end
  end
end