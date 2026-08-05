# ===== SANSKRITWEEK SETTINGS CONTROLLER =====
# To remove: delete this file and its routes

class SanskritweekSettingsController < ApplicationController

  before_action :require_member

  # GET /sanskritweek/settings
  def edit
    # google_form_url is the key we use
    @setting = SanskritweekSetting.find_or_initialize_by(key: 'google_form_url')
  end

  # PATCH /sanskritweek/settings
  def update
    @setting = SanskritweekSetting.find_or_initialize_by(key: 'google_form_url')
    if @setting.update(value: params[:value])
      redirect_to sw_settings_path, notice: "Google Form link updated!"
    else
      render :edit
    end
  end

  private

  def require_member
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
  end

end
# ===== END SANSKRITWEEK SETTINGS CONTROLLER =====