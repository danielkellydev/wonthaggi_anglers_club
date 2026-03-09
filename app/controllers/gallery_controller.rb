class GalleryController < ApplicationController
  allow_unauthenticated_access

  def index
    @gallery_images = GalleryImage.ordered
  end
end
