# ===== SANSKRITWEEK CONTROLLER =====
class SanskritweekController < ApplicationController

  def home
    if session[:member]
      redirect_to sanskritweek_member_path
    elsif session[:user]
      redirect_to sanskritweek_user_path
    else
      load_public_data
    end
  end

  def usanskritweek
    unless session[:user] || session[:member]
      redirect_to user_login_path, alert: "Please login!"
    end
    load_public_data
  end

  def usanskritweekn
    unless session[:user] || session[:member]
      redirect_to user_login_path, alert: "Please login!"
    end
  end

  def msanskritweekc
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
    load_public_data
  end

  def msanskritweekr
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
  end

  def msanskritweeku
    unless session[:member]
      redirect_to member_login_path, alert: "Members only!"
    end
  end

  private

  def load_public_data
  @events_by_day   = SanskritweekEvent.all.order(:day, :category).group_by(&:day)
  @past_events     = SanskritweekPastEvent.includes(:sanskritweek_photos).order(year: :desc)
  @google_form_url = SanskritweekSetting.get('google_form_url')
end

end
# ===== END SANSKRITWEEK CONTROLLER =====