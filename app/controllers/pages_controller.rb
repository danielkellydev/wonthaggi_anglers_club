class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @recent_posts = Post.published.limit(3)
    @upcoming_events = Event.published.upcoming.limit(3)
    @gallery_images = GalleryImage.ordered.limit(6)
  end
end
