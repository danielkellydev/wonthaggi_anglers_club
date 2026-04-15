class SitemapsController < ApplicationController
  def show
    @posts = Post.published
    @events = Event.published.order(starts_at: :desc)
    expires_in 1.hour, public: true
    respond_to do |format|
      format.xml
    end
  end
end
