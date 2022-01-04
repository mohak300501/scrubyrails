class ShlokaController < ApplicationController
    def ashlokar
        if session[:admin]
            render "ashlokar"
        else
            redirect_to root_url
        end
    end

    def ashlokac
        if session[:admin]
            render "ashlokac"
        else
            redirect_to root_url
        end
    end

    def ashlokacp
        flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
        redirect_to shloka_ashlokar_path
    end

    def ashlokau
    end

    def ashlokad
        unless session[:admin]
            redirect_to root_url
        end
    end
end
