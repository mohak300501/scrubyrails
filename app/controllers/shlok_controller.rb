class ShlokController < ApplicationController
    def ashlokr
        if session[:admin]
            render "ashlokr"
        else
            redirect_to root_url
        end
    end

    def ashlokc
        if session[:admin]
            render "ashlokc"
        else
            redirect_to root_url
        end
    end

    def ashlokcp
        shlok = Shlok.new(:title => params[:title], :shlok => params[:shlok], :translation => [:translation])
        shlok.save
        flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
        redirect_to shlok_ashlokr_path
    end

    def ashloku
    end

    def ashlokd
        unless session[:admin]
            redirect_to root_url
        end
    end
end
