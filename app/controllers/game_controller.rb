class GameController < ApplicationController
    def ugame
        render "ugame"
    end

    def mgamer
        if session[:member]
            render "mgamer"
        else
            redirect_to root_url
        end
    end

    def mgamec
        if session[:member]
            render "mgamec"
        else
            redirect_to root_url
        end
    def mgameu
        if session[:member]
            render "mgameu"
        else
            redirect_to root_url
        end
    end
    end
end
