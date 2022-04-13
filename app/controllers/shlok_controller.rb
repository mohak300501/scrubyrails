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
            @id = params[:id]
            @shlok = Shlok.find_by(id: @id)
            render "mshloku"
        else
            redirect_to root_url
        end
    end

    def mshlokup
        shlok = Shlok.find(params[:id])
        shlok.update(:title => params[:title], :shlok => params[:shlok], :translation => params[:translation],
                        :updated_by => session[:email])
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
