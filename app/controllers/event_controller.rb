class EventController < ApplicationController
    def uevent
        @events = Event.all.order(id: :desc)
        render "uevent"
    end

    def meventr
        if session[:member]
            @events = Event.all.order(id: :desc)
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
        change = Change.new(:time => Time.now, :email => session[:email], :table => "events", :cord => "create")
        change.save
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
        pp = params[:event]
        event.update(:name => pp[:name], :info => pp[:info])
        if pp[:image].present?
            event.image.purge
            event.image.attach(pp[:image])
        end
        change = Change.new(:time => Time.now, :email => session[:email], :table => "events", :cord => "update")
        change.save
        flash[:notice] = "घटना परिवर्तितः जातः!"
        redirect_to all_events_path
    end

    def meventdp
        if session[:member]
            event = Event.find(params[:id])
            event.destroy
            change = Change.new(:time => Time.now, :email => session[:email], :table => "events", :cord => "delete")
            change.save
            redirect_to all_events_path
        else
            redirect_to root_url
        end
    end
end