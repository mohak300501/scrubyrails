class LoggingController < ApplicationController
    def login
        if Member.find_by(email: params[:email])
            if Member.find_by(email: params[:email]).password == params[:password]
                session[:user] = "sc"
                redirect_to shloka_ashlokar_path
            else
                flash.now[:notice] = "Password does not match"
            end
        else
            flash.now[:notice] = "Email not found"
        end
    end
    def logout
        session.delete(:user)
        redirect_to root_url
    end
end
