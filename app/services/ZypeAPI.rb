module ZypeAPI
    class Videos
      def self.show_all
        Faraday.get "https://api.zype.com/videos?per_page=500&sort=published_at&app_key=#{ENV['APP_KEY']}"
      end

      def self.authenticate(username, password)
        Faraday.get "https://login.zype.com/oauth/token?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&username=#{username}&password=#{password}&grant_type=password"
      end
    end
  end