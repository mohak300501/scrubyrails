class LoggingController < ApplicationController
    def login
        @mssg = nil
        if Member.find_by(email: params[:email])
            if Member.find_by(email: params[:email]).password == params[:password]
                session[:user] = "sc"
                redirect_to shloka_ashlokar_path
            else
                @mssg = "Password does not match"
            end
        else
            @mssg = "Email not found"
        end
    end
    def logout
        session.delete(:user)
        redirect_to root_url
    end
end
