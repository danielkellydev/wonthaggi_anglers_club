module Admin
  class DashboardController < BaseController
    def index
      @posts_count = Post.count
      @events_count = Event.count
      @gallery_images_count = GalleryImage.count
      @recent_posts = Post.order(created_at: :desc).limit(5)
      @upcoming_events = Event.upcoming.limit(5)
    end
  end
end
