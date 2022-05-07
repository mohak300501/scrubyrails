class ShlokController < ApplicationController
    def ushlok
        @shloks = Shlok.all
        render "ushlok"
    end

    def mshlokr
        if session[:member]
            @shloks = Shlok.all
            render "mshlokr"
        else
            redirect_to root_url
        end
    end

    def mshlokc
        if session[:member]
            render "mshlokc"
        else
            redirect_to root_url
        end
    end

    def mshlokcp
        shlok = Shlok.new(:title => params[:title], :shlok => params[:shlok], :translation => params[:translation],
                            :updated_by => session[:email], :audio => params[:audio])
        shlok.save
        flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
        redirect_to all_shloks_path
    end

    def mshloku
        if session[:member]
            @shlok = Shlok.find(params[:id])
            render "mshloku"
        else
            redirect_to root_url
        end
    end

    def mshlokup
        shlok = Shlok.find(params[:id])
        pp = params[:shlok]
        shlok.update(:title => pp[:title], :shlok => pp[:shlok], :translation => pp[:translation],
                        :updated_by => session[:email])
        if pp[:audio].present?
            shlok.audio.purge
            shlok.audio.attach(pp[:audio])
        end
        flash[:notice] = "श्लोकः परिवर्तितः जातः!"
        redirect_to all_shloks_path
    end

    def mshlokdp
        if session[:member]
            shlok = Shlok.find(params[:id])
            shlok.destroy
            redirect_to all_shloks_path
        else
            redirect_to root_url
        end
    end
end
