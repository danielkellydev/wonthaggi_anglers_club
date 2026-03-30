class PagesController < ApplicationController
  allow_unauthenticated_access

  def home
    @recent_posts = Post.published.limit(3)
    @upcoming_events = Event.published.upcoming.limit(3)
    @gallery_images = GalleryImage.ordered.limit(6)
    @sponsors = Sponsor.ordered
  end

  def about
  end

  def sponsors
    @sponsors = Sponsor.ordered
  end

  def fish_points
    @fish_points = FishPoint.ordered
  end

  def membership
    @membership_fees = MembershipFee.ordered
    @committee_members = CommitteeMember.ordered
    @membership_form = SiteSetting.membership_form
  end
end
