class WelcomeController < ApplicationController
    def home
        @news = Announcement.all
        @visit = session[:visit]
    end

    def mhomer
        if session[:member]
            @news = Announcement.all
            @visit = session[:visit]
            render "mhomer"
        else
            redirect_to root_url
        end
    end

    def mnewsc
        if session[:member]
            render "mnewsc"
        else
            redirect_to root_url
        end
    end

    def mnewscp
        news = Announcement.new(:news => params[:news])
        news.save
        flash[:notice] = "नूतनः announcementH योजितः जातः!"
        redirect_to home_path
    end

    def mnewsu
        if session[:member]
            @news = Announcement.find(params[:id])
            render "mnewsu"
        else
            redirect_to root_url
        end
    end

    def mnewsup
        news = Announcement.find(params[:id])
        news.update(:news => params[:announcement][:news])
        flash[:notice] = "announcementH परिवर्तितः जातः!"
        redirect_to home_path
    end

    def mnewsdp
        news = Announcement.find(params[:id])
        news.destroy
        redirect_to home_path
    end

    def memarea
        if session[:member]
            render "memarea"
        else
            redirect_to root_url
        end
    end
end
