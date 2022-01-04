class LoggingController < ApplicationController
    def login
        if params[:password] == ENV["ADMIN_ACCESS"]
            session[:user] = "sc"
            redirect_to shloka_ashlokar_path
        end
    end
    def logout
        session.delete(:user)
        redirect_to root_url
    end
end
