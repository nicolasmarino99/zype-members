require 'uri'
require 'net/http'
require 'openssl'

module ZypeAPI
    class Videos
      def self.show_all
        url = URI("https://api.zype.com/videos?per_page=500&sort=published_at&app_key=#{ENV['APP_KEY']}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["Accept"] = 'application/json'

        response = http.request(request).read_body
        response
      end

      def self.show_info(video_id)
        Faraday.get "https://api.zype.com/videos?#{video_id}&app_key=#{ENV['APP_KEY']}"
      end

      def self.authenticate(username, password)
        url = URI("https://login.zype.com/oauth/token?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&username=#{username}&password=#{password}&grant_type=#{ENV['PASSWORD']}")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Accept"] = 'application/json'

        response = http.request(request).read_body
        response
      end
    end
  end