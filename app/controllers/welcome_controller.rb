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
            render "mhomec"
        else
            redirect_to root_url
        end
    end

    def mhomeu
        if session[:member]
            render "mhomeu"
        else
            redirect_to root_url
        end
    end

    def memarea
        if session[:member]
            render "memarea"
        else
            redirect_to root_url
        end
    end
end
