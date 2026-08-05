# ===== SANSKRITWEEK PAST EVENTS CONTROLLER =====
# To remove: delete this file and its routes

class SanskritweekPastEventsController < ApplicationController

  before_action :require_member
  before_action :set_past_event, only: [:edit, :update, :destroy]

  # GET /sanskritweek/past
  def index
    @past_events = SanskritweekPastEvent.all.order(year: :desc)
  end

  # GET /sanskritweek/past/new
  def new
    @past_event = SanskritweekPastEvent.new
  end

  # POST /sanskritweek/past
  def create
    @past_event = SanskritweekPastEvent.new(past_event_params)
    if @past_event.save
      redirect_to sw_past_events_path, notice: "Past event added successfully!"
    else
      render :new
    end
  end

  # GET /sanskritweek/past/:id/edit
  def edit
  end

  # PATCH /sanskritweek/past/:id
  def update
    if @past_event.update(past_event_params)
      redirect_to sw_past_events_path, notice: "Past event updated!"
    else
      render :edit
    end
  end

  # DELETE /sanskritweek/past/:id
  def destroy
    @past_event.destroy
    redirect_to sw_past_events_path, notice: "Past event deleted."
  end

  # DELETE single photo from past event
def destroy_photo
  @past_event = SanskritweekPastEvent.find(params[:id])
  photo = @past_event.photos.find(params[:photo_id])
  photo.purge
  redirect_to sw_edit_past_event_path(@past_event), notice: "Photo deleted."
end
def show
  @past_event = SanskritweekPastEvent.find(params[:id])
  redirect_to sw_edit_past_event_path(@past_event)
end

  private

  def set_past_event
    @past_event = SanskritweekPastEvent.find(params[:id])
  end

  def past_event_params
  params.require(:sanskritweek_past_event).permit(
    :year, :title, :description,
    :highlight_text, :cover_image_url,
    photos: []
  )
end

  def require_member
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
  end

end
# ===== END SANSKRITWEEK PAST EVENTS CONTROLLER =====