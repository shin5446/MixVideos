module VideosHelper
  # require 'net/http'
  # require 'uri'

  # 動画のURLを埋め込み用に変換
  def embed_url(video)
    video.url.gsub(%r{https://www.youtube.com/watch\?v=(\w+)}) { "https://www.youtube.com/embed/#{Regexp.last_match(1)}" }
  end

  # def video_exist?(url)

  #   uri = URI.parse(url)
  #   request = Net::HTTP::Head.new(uri)

  #   req_options = {
  #     use_ssl: uri.scheme == "https",
  #   }

  #   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #     http.request(request)
  #   end
  #    if response.code != "200"
  #     false
  #    end
  # end
end
