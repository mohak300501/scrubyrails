class TeamController < ApplicationController
    def uteam
        @teams = Team.all.order(id: :desc)
        @alumnis = Alumni.all.order(name: :asc)
        @group_photos = GroupPhoto.all.order(created_at: :desc).map { |gp| gp.image if gp.image.attached? }.compact
        render "uteam"
    end

    def mteamr
        if session[:member]
            @teams = Team.all.order(id: :desc)
            @alumnis = Alumni.all.order(created_at: :desc)  # ADD THIS LINE
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
        if session[:member]
            team = Team.new(:name => params[:name], :year => params[:year], :branch => params[:branch], :mail => params[:mail], :image => params[:image])
            team.save
            change = Change.new(:time => Time.now, :email => session[:email], :table => "teams", :cord => "create")
            change.save
            flash[:notice] = "नूतनः सदस्यः योजितः जातः!"
            redirect_to all_teams_path
        else
            redirect_to root_url
        end
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
        if session[:member]
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
        else
            redirect_to root_url
        end
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

    # Alumni CRUD operations

    def malumnicp
        if session[:member]
            alumni = Alumni.new(
                name: params[:name],
                branch: params[:branch],
                mail: params[:mail],
                linkedin: params[:linkedin]
            )
            
            if params[:image].present?
                uploaded_file = params[:image]
                file_name = "#{Time.now.to_i}_#{uploaded_file.original_filename}"
                file_path = Rails.root.join('public', 'uploads', 'alumni', file_name)
                
                FileUtils.mkdir_p(File.dirname(file_path))
                File.open(file_path, 'wb') do |file|
                    file.write(uploaded_file.read)
                end
                
                alumni.image = "/uploads/alumni/#{file_name}"
            end
            
            if alumni.save
                change = Change.new(time: Time.now, email: session[:email], table: "alumni", cord: "create")
                change.save
                flash[:notice] = 'पूर्वछात्रः सफलतया योजितः।'
                redirect_to all_teams_path  # Redirect to mteamr which shows both
            else
                flash[:alert] = 'त्रुटिः अभवत्।'
                redirect_to new_team_path  # Redirect to mteamc which has both forms
            end
        else
            redirect_to root_url
        end
    end

    def malumniu
        if session[:member]
            @alumni = Alumni.find(params[:id])
            render "malumniu"
        else
            redirect_to root_url
        end
    end

    def malumniup
        if session[:member]
            @alumni = Alumni.find(params[:id])
            
            @alumni.name = params[:alumni][:name] if params[:alumni][:name].present?
            @alumni.branch = params[:alumni][:branch] if params[:alumni][:branch].present?
            @alumni.mail = params[:alumni][:mail] if params[:alumni][:mail].present?
            @alumni.linkedin = params[:alumni][:linkedin] if params[:alumni][:linkedin].present?
            
            if params[:alumni][:image].present?
                # Delete old image
                old_image_path = Rails.root.join('public', @alumni.image) if @alumni.image
                File.delete(old_image_path) if old_image_path && File.exist?(old_image_path)
                
                # Upload new image
                uploaded_file = params[:alumni][:image]
                file_name = "#{Time.now.to_i}_#{uploaded_file.original_filename}"
                file_path = Rails.root.join('public', 'uploads', 'alumni', file_name)
                
                FileUtils.mkdir_p(File.dirname(file_path))
                File.open(file_path, 'wb') do |file|
                    file.write(uploaded_file.read)
                end
                
                @alumni.image = "/uploads/alumni/#{file_name}"
            end
            
            if @alumni.save
                change = Change.new(time: Time.now, email: session[:email], table: "alumni", cord: "update")
                change.save
                flash[:notice] = 'पूर्वछात्रः सफलतया अद्यतनीकृतः।'
                redirect_to all_alumni_path
            else
                flash[:alert] = 'त्रुटिः अभवत्।'
                redirect_to alumni_path(@alumni)
            end
        else
            redirect_to root_url
        end
    end

    def malumnidp
        if session[:member]
            @alumni = Alumni.find(params[:id])
            
            # Delete image file
            image_path = Rails.root.join('public', @alumni.image) if @alumni.image
            File.delete(image_path) if image_path && File.exist?(image_path)
            
            @alumni.destroy
            change = Change.new(time: Time.now, email: session[:email], table: "alumni", cord: "delete")
            change.save
            flash[:notice] = 'पूर्वछात्रः सफलतया नष्टः।'
            redirect_to all_alumni_path
        else
            redirect_to root_url
        end
    end
end