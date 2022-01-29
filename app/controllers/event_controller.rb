class EventController < ApplicationController
    def uevent
        render "uevent"
    end

    def meventr
        if session[:member]
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
end
