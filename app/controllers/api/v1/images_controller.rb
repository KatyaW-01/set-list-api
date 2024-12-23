class Api::V1::ImagesController < ApplicationController
  def show
    first_photo = ImageGateway.get_images_for_artist(params[:artist])

    render json: ImageSerializer.format_image(first_photo)
  end
end