class ImageGateway
  def self.conn
    Faraday.new(url: "https://api.pexels.com") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials.pexels[:key]
    end
  end

  def self.get_images_for_artist(artist)
    sleep(3)
    response = conn.get("/v1/search", { query: artist })
    # OR response = conn.get("/v1/search?query=#{artist})

    json = JSON.parse(response.body, symbolize_names: true)
    json[:photos][0]
  end
end