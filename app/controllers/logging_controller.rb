class LoggingController < ApplicationController
    def login
    end
    def loging
        unless Member.find_by(email: params[:email]).nil?
            if Member.find_by(email: params[:email]).password == params[:password]
                session[:user] = "sc"
                redirect_to shloka_ashlokar_path
            else
                flash.now[:notice] = "Password does not match"
                redirect_to logging_login_path
            end
        else
            flash.now[:notice] = "Email not found"
            redirect_to logging_login_path
        end
    end
    def logout
        session.delete(:user)
        redirect_to root_url
    end
end
