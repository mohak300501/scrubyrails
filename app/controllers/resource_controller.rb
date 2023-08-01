class ResourceController < ApplicationController
    def uresource
        @resources = Resource.all
        render "uresource"
    end

    def mresourcer
        if session[:member]
            @resources = Resource.all
            render "mresourcer"
        else
            redirect_to root_url
        end
    end

    def mresourcec
        if session[:member]
            render "mresourcec"
        else
            redirect_to root_url
        end
    end

    def mresourcecp
        resource = Resource.new(:name => params[:name], :link => params[:link])
        resource.save
        change = Change.new(:time => Time.now, :email => session[:email], :table => "resources", :cord => "create")
        change.save
        flash[:notice] = "नूतनः साधनसम्पत्ति: योजितः जातः!"
        redirect_to all_resources_path
    end

    def mresourceu
        if session[:member]
            @resource = Resource.find(params[:id])
            render "mresourceu"
        else
            redirect_to root_url
        end
    end

    def mresourceup
        resource = Resource.find(params[:id])
        pp = params[:resource]
        resource.update(:title => pp[:title], :resource => pp[:resource], :translation => pp[:translation],
                        :updated_by => session[:email])
        if pp[:audio].present?
            resource.audio.purge
            resource.audio.attach(pp[:audio])
        end
        change = Change.new(:time => Time.now, :email => session[:email], :table => "resources", :cord => "update")
        change.save
        flash[:notice] = "साधनसम्पत्ति: परिवर्तितः जातः!"
        redirect_to all_resources_path
    end

    def mresourcedp
        if session[:member]
            resource = Resource.find(params[:id])
            resource.destroy
            change = Change.new(:time => Time.now, :email => session[:email], :table => "resources", :cord => "delete")
            change.save
            redirect_to all_resources_path
        else
            redirect_to root_url
        end
    end
end
