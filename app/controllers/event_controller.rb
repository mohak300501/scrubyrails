class EventController < ApplicationController
    def uevent
        @events = Event.all
        render "uevent"
    end

    def meventr
        if session[:member]
            @events = Event.all
            render "meventr"
        else
            redirect_to root_url
        end
    end

    def meventc
        if session[:member]
            render "meventc"
        else
            redirect_to root_url
        end
    end    

    def meventcp
        event = Event.new(:name => params[:name], :info => params[:info], :image => params[:image])
        event.save
        flash[:notice] = "नूतना घटना योजितः जातः!"
        redirect_to all_events_path
    end

    def meventu
        if session[:member]
            @id = params[:id]
            @event = Event.find_by(id: @id)
            render "meventu"
        else
            redirect_to root_url
        end
    end

    def meventup
        event = Event.find(params[:id])
        event.update(:name => params[:name], :info => params[:info])
        flash[:notice] = "घटना परिवर्तितः जातः!"
        redirect_to all_events_path
    end

    def meventdp
        if session[:member]
            event = Event.find(params[:id])
            event.destroy
            redirect_to all_events_path
        else
            redirect_to root_url
        end
    end
end