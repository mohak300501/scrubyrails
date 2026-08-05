# ===== SANSKRITWEEK EVENTS CONTROLLER =====
# To remove: delete this file and its routes

class SanskritweekEventsController < ApplicationController

  # Member-only guard — all actions require member login
  before_action :require_member
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /sanskritweek/events — list all events
 def index
  @events = SanskritweekEvent.all.order(:day, :category)
  @events_by_day = @events.group_by(&:day)
end
def destroy
    @event.destroy
    redirect_to sw_events_path, notice: "Event deleted."
  end
  # GET /sanskritweek/events/:id
  def show
  @event = SanskritweekEvent.find(params[:id])
  redirect_to sw_edit_event_path(@event)
end

  # GET /sanskritweek/events/new
  def new
    @event = SanskritweekEvent.new
  end

  # POST /sanskritweek/events
  def create
    @event = SanskritweekEvent.new(event_params)
    if @event.save
      redirect_to sw_events_path, notice: "Event created successfully!"
    else
      render :new
    end
  end

  # GET /sanskritweek/events/:id/edit
  def edit
  end

  # PATCH /sanskritweek/events/:id
  def update
    if @event.update(event_params)
      redirect_to sw_events_path, notice: "Event updated successfully!"
    else
      render :edit
    end
  end

 
  private

  def set_event
    @event = SanskritweekEvent.find(params[:id])
  end

  def event_params
  params.require(:sanskritweek_event).permit(
    :title, :title_sanskrit, :category,
    :day, :description, :venue,
    :team_size, :poster_url, :status,
    :date, :time, :eligibility,
    :prize, :registration_link,
    :poster_image
  )
end
# DELETE poster from event
def destroy_poster
  @event = SanskritweekEvent.find(params[:id])
  @event.poster_image.purge
  redirect_to sw_edit_event_path(@event), notice: "Poster deleted."
end

  def require_member
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
  end

end
# ===== END SANSKRITWEEK EVENTS CONTROLLER =====