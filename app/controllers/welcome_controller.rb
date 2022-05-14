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
            @sr = params[:id]
            @news = Announcement.find_by(id: @sr)
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

    def mannouncementcp
        news = Announcement.new(:news => params[:news])
        news.save
        flash[:notice] = "नूतनः announcementH योजितः जातः!"
        redirect_to all_announcements_path
    end
    
    def mannouncementdp
        news = Announcement.find(params[:id])
        news.destroy
        redirect_to all_announcements_path
    end

    def mannouncementup
        news = Announcement.find(params[:id])
        news.update(:news => params[:news])
        flash[:notice] = "announcementH परिवर्तितः जातः!"
        redirect_to all_announcements_path
    end
end
