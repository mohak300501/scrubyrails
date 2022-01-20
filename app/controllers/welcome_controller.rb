class WelcomeController < ApplicationController
    def home
        @visit = session[:visit]
    end
    def mhomer
        if session[:member]
            render "mhomer"
        else
            redirect_to root_url
        end
    end
end
