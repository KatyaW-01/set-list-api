class ImageSerializer
  def self.format_image(image_data)
    {
      data: {
        id: nil,
        type: "image",
        attributes: {
          image_url: image_data[:url],
          photographer: image_data[:photographer],
          photographer_url: image_data[:photographer_url],
          alt_text: image_data[:alt]
        }
      }
    }
  end
end