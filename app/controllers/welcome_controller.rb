class WelcomeController < ApplicationController
    def home
        @news = Announcement.all
        @visit = session[:visit]
    end
    def mhomer
        if session[:member]
            @news = Announcement.all
            render "mhomer"
        else
            redirect_to root_url
        end
    end
    def mhomec
        if session[:member]
            render "mshlokc"
        else
            redirect_to root_url
        end
    end
    def mhomeu
        if session[:member]
            render "mshlokc"
        else
            redirect_to root_url
        end
    end
end
