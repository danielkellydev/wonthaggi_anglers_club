class EventsController < ApplicationController
  allow_unauthenticated_access

  def index
    @upcoming_events = Event.published.upcoming
    @past_events = Event.published.past
  end

  def show
    @event = Event.published.find_by!(slug: params[:slug])
  end
end
