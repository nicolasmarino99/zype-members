require 'uri'
require 'net/http'
require 'openssl'

module ZypeAPI
    class Videos
      def self.show_all
        url = URI("https://api.zype.com/videos?per_page=500&sort=published_at&app_key=XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Accept"] = 'application/json'

        response = http.request(request).read_body
        response
      end

      def self.show_info(video_id)
        Faraday.get "https://api.zype.com/videos?#{video_id}&app_key=#{ENV['APP_KEY']}"
      end

      def self.authenticate(username, password)
        url = URI("https://login.zype.com/oauth/token?client_id=61255480307354ebd4d094482f2483adec9942637979aa5c3963ecbac469f943&client_secret=926e632b2aa9758f60dbdf2f8de13bebd9a04dfd602de4c257b3f8b4a97cf0b8&username=#{username}&password=#{password}&grant_type=password")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Accept"] = 'application/json'

        response = http.request(request).read_body
        response
      end
    end
  end