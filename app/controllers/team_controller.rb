class TeamController < ApplicationController
    def umember
        @members = Member.all
        render "umember"
    end

    def mmemberr
        if session[:member]
            @members = Member.all
            render "mmemberr"
        else
            redirect_to root_url
        end
    end

    def mmemberc
        if session[:member]
            render "mmemberc"
        else
            redirect_to root_url
        end
    end

    def mmembercp
        team = Team.new(:title => params[:title], :team => params[:team],
                            :updated_by => session[:email], :audio => params[:audio])
        team.save
        flash[:notice] = "नूतनः श्लोकः योजितः जातः!"
        redirect_to all_teams_path
    end

    def mteamu
        if session[:member]
            @team = Team.find(params[:id])
            render "mteamu"
        else
            redirect_to root_url
        end
    end

    def mteamup
        team = Team.find(params[:id])
        pp = params[:team]
        team.update(:title => pp[:title], :team => pp[:team], :translation => pp[:translation],
                        :updated_by => session[:email])
        if pp[:audio].present?
            team.audio.purge
            team.audio.attach(pp[:audio])
        end
        flash[:notice] = "श्लोकः परिवर्तितः जातः!"
        redirect_to all_teams_path
    end

    def mteamdp
        if session[:member]
            team = Team.find(params[:id])
            team.destroy
            redirect_to all_teams_path
        else
            redirect_to root_url
        end
    end
end
