module ZypeAPI
    class Videos
      def self.show_all
        Faraday.get 'https://api.zype.com/videos?sort=published_at&app_key=' + ENV['APP_KEY']
      end
    end
  end