class LoggingController < ApplicationController
    def login
        if params[:password] == Member.first.password
            session[:user] = "sc"
            redirect_to shloka_ashlokar_path
        end
    end
    def logout
        session.delete(:user)
        redirect_to root_url
    end
end
