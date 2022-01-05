class ShlokController < ApplicationController
    def rshlok
        @shloks = Shlok.all
        render "rshlok"
    end

    def ashlokr
        if session[:admin]
            @shloks = Shlok.all
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
        shlok = Shlok.new(:title => params[:title], :shlok => params[:shlok], :translation => params[:translation])
        shlok.save
        flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
        redirect_to shlok_ashlokr_path
    end

    def ashloku
        if session[:admin]
            @shlok = Shlok.find(:id)
            render "ashloku"
        else
            redirect_to root_url
        end
    end

    def ashlokup
        shlok = Shlok.find(:id)
        shlok.update(:title => params[:title], :shlok => params[:shlok], :translation => params[:translation])
        flash[:notice] = "श्लोकः परिवर्तितः जातः!"
        redirect_to shlok_ashlokr_path
    end

    def ashlokdp
        shlok = Shlok.find(:id)
        shlok.destroy
    end
end
