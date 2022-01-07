class WelcomeController < ApplicationController
    def home
        session[:visit] ||= 0
        session[:visit] += 1
        @visit = session[:visit]
    end

    def profile
        if session[:user]
            @user = User.find_by(email: session[:email])
            render "profile"
        else
            redirect_to root_url
        end
    end
end
