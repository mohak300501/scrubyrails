class TeamController < ApplicationController
    def uteam
        @teams = Team.all.order(id: :desc)
        @group_photos = GroupPhoto.all.order(created_at: :desc).map { |gp| gp.image if gp.image.attached? }.compact
        render "uteam"
    end

    def mteamr
        if session[:member]
            @teams = Team.all.order(id: :desc)
            render "mteamr"
        else
            redirect_to root_url
        end
    end

    def mteamc
        if session[:member]
            render "mteamc"
        else
            redirect_to root_url
        end
    end    

    def mteamcp
        team = Team.new(:name => params[:name], :year => params[:year], :branch => params[:branch], :mail => params[:mail], :image => params[:image])
        team.save
        change = Change.new(:time => Time.now, :email => session[:email], :table => "teams", :cord => "create")
        change.save
        flash[:notice] = "नूतनः सदस्यः योजितः जातः!"
        redirect_to all_teams_path
    end

    def mteamu
        if session[:member]
            @id = params[:id]
            @team = Team.find_by(id: @id)
            render "mteamu"
        else
            redirect_to root_url
        end
    end

    def mteamup
        team = Team.find(params[:id])
        pp = params[:team]
        team.update(:name => pp[:name], :year => pp[:year], :branch => pp[:branch], :mail => pp[:mail])
        if pp[:image].present?
            team.image.purge
            team.image.attach(pp[:image])
        end
        change = Change.new(:time => Time.now, :email => session[:email], :table => "teams", :cord => "update")
        change.save
        flash[:notice] = "सदस्यः परिवर्तितः जातः!"
        redirect_to all_teams_path
    end

    def mteamdp
        if session[:member]
            team = Team.find(params[:id])
            team.destroy
            change = Change.new(:time => Time.now, :email => session[:email], :table => "teams", :cord => "delete")
            change.save
            flash[:notice] = "सदस्यः विलोपितः जातः!"
            redirect_to all_teams_path
        else
            redirect_to root_url
        end
    end

    def mgroup_photos
        if session[:member]
            @group_photos = GroupPhoto.all.order(created_at: :desc)
            render "mgroup_photos"
        else
            redirect_to root_url
        end
    end

    def mgroup_photo_create
        if session[:member]
            group_photo = GroupPhoto.new(image: params[:image])
            if group_photo.save
                change = Change.new(time: Time.now, email: session[:email], table: "group_photos", cord: "create")
                change.save
                flash[:notice] = "समूह चित्रं योजितं जातम्!"
            else
                flash[:alert] = "समूह चित्रं योजितुं न शक्यम्!"
            end
            redirect_to group_photos_path
        else
            redirect_to root_url
        end
    end

    def mgroup_photo_delete
        if session[:member]
            group_photo = GroupPhoto.find(params[:id])
            group_photo.destroy
            change = Change.new(time: Time.now, email: session[:email], table: "group_photos", cord: "delete")
            change.save
            flash[:notice] = "समूह चित्रं विलोपितं जातम्!"
            redirect_to group_photos_path
        else
            redirect_to root_url
        end
    end
end