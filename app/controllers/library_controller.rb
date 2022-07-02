class LibraryController < ApplicationController
    def ulibrary
        render "ulibrary"
    end

    def mlibraryr
        if session[:member]
            render "mlibraryr"
        else
            redirect_to root_url
        end
    end

    def mlibraryc
        if session[:member]
        else
            redirect_to root_url
        end
    end

    def mlibraryu
        if session[:member]
            render "mlibraryu"
        else
            redirect_to root_url
        end
    end
end
