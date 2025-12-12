class LibraryController < ApplicationController
    def ulibrary
        @librarys = Library.all  # This was missing!
        render "ulibrary"
    end

    def mlibraryr
        if session[:member]
            @librarys = Library.all  # Add this for consistency
            render "mlibraryr"
        else
            redirect_to root_url
        end
    end

    def mlibraryc
        if session[:member]
            render "mlibraryc"  # This was missing!
        else
            redirect_to root_url
        end
    end

    def mlibrarycp
        library = Library.new(:title => params[:title], :library => params[:library], :translation => params[:translation],
                            :updated_by => session[:email])
        library.save
        change = Change.new(:time => Time.now, :email => session[:email], :table => "librarys", :cord => "create")
        change.save
        flash[:notice] = "नूतनः ग्रन्थः योजितः जातः!"
        redirect_to all_librarys_path
    end

    def mlibraryu
        if session[:member]
            @library = Library.find(params[:id])
            render "mlibraryu"
        else
            redirect_to root_url
        end
    end

    def mlibraryup
        library = Library.find(params[:id])
        pp = params[:library]
        library.update(:title => pp[:title], :library => pp[:library], :translation => pp[:translation],
                        :updated_by => session[:email])
        change = Change.new(:time => Time.now, :email => session[:email], :table => "librarys", :cord => "update")
        change.save
        flash[:notice] = "ग्रन्थः परिवर्तितः जातः!"
        redirect_to all_librarys_path
    end

    def mlibrarydp
        if session[:member]
            library = Library.find(params[:id])
            library.destroy
            change = Change.new(:time => Time.now, :email => session[:email], :table => "librarys", :cord => "delete")
            change.save
            redirect_to all_librarys_path
        else
            redirect_to root_url
        end
    end
end
