# ===== SANSKRITWEEK PHOTOS CONTROLLER =====
class SanskritweekPhotosController < ApplicationController
  before_action :require_member
  before_action :set_past_event

  def index
    @photos = @past_event.sanskritweek_photos
  end

  def new
    @photo = SanskritweekPhoto.new
  end

def create
  if params[:sanskritweek_photo][:image].present?
    params[:sanskritweek_photo][:image].each do |img|
      photo = SanskritweekPhoto.new(
        past_event_id: @past_event.id,
        heading:       params[:sanskritweek_photo][:heading],
        description:   params[:sanskritweek_photo][:description]
      )
      photo.image.attach(img)
      photo.save
    end
    redirect_to sw_past_photos_path(@past_event), notice: "Photos added!"
  else
    redirect_to sw_new_past_photo_path(@past_event), alert: "Please select at least one photo."
  end
end

  def edit
    @photo = @past_event.sanskritweek_photos.find(params[:photo_id])
  end

  def update
    @photo = @past_event.sanskritweek_photos.find(params[:photo_id])
    if @photo.update(photo_params)
      if params[:sanskritweek_photo][:image].present?
        @photo.image.purge
        @photo.image.attach(params[:sanskritweek_photo][:image])
      end
      redirect_to sw_past_photos_path(@past_event), notice: "Photo updated!"
    else
      render :edit
    end
  end

  def destroy
    @photo = @past_event.sanskritweek_photos.find(params[:photo_id])
    @photo.destroy
    redirect_to sw_past_photos_path(@past_event), notice: "Photo deleted."
  end

  private

  def set_past_event
    @past_event = SanskritweekPastEvent.find(params[:id])
  end

  def photo_params
    params.require(:sanskritweek_photo).permit(:heading, :description)
  end

  def require_member
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
  end
end
# ===== END SANSKRITWEEK PHOTOS CONTROLLER =====