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

    def about
        @about = About.first.about
        render "abouts"
    end

    def htuse
        @htuse = About.first.htuse
        render "abouts"
    end

    def terms
        @terms = About.first.terms
        render "abouts"
    end

    def maboutu
        if session[:member]
            @about = About.first
            render "maboutsu"
        else
            redirect_to root_url
        end
    end

    def mhtuseu
        if session[:member]
            @htuse = About.first
            render "maboutsu"
        else
            redirect_to root_url
        end
    end

    def mtermsu
        if session[:member]
            @terms = About.first
            render "maboutsu"
        else
            redirect_to root_url
        end
    end

    def maboutup
        if session[:member]
            pp = params[:about]
            about = About.first
            about.update(:about => pp[:about])
            redirect_to about_path
        else
            redirect_to root_url
        end
    end

    def mhtuseup
        if session[:member]
            pp = params[:about]
            htuse = About.first
            htuse.update(:htuse => pp[:htuse])
            redirect_to htuse_path
        else
            redirect_to root_url
        end
    end

    def mtermsup
        if session[:member]
            pp = params[:about]
            terms = About.first
            terms.update(:terms => pp[:terms])
            redirect_to terms_path
        else
            redirect_to root_url
        end
    end
end
