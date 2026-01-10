class GameController < ApplicationController
    def ugame
        @games = Game.all
        render "ugame"
    end

    def ugamen
        @game = Game.find_by(id: params[:id])
        if @game
            render "ugamen"
        else
            flash[:alert] = "क्रीडा न प्राप्ता!"
            redirect_to games_path
        end
    end

    def mgamer
        if session[:member]
            @games = Game.all
            render "mgamer"
        else
            redirect_to root_url
        end
    end

    def mgamec
        if session[:member]
            render "mgamec"
        else
            redirect_to root_url
        end
    end

    def mgameu
        if session[:member]
            @game = Game.find_by(id: params[:id])
            render "mgameu"
        else
            redirect_to root_url
        end
    end

    def mgamecp
        game = Game.new(:name => params[:name], :info => params[:info])
        if params[:image].present?
            game.image.attach(params[:image])
        end
        game.save
        change = Change.new(:time => Time.now, :email => session[:email], :table => "games", :cord => "create")
        change.save
        flash[:notice] = "नूतनः क्रीडा योजितः जातः!"
        redirect_to all_games_path
    end
    
    def mgamedp
        game = Game.find(params[:id])
        game.destroy
        change = Change.new(:time => Time.now, :email => session[:email], :table => "games", :cord => "delete")
        change.save
        flash[:notice] = "क्रीडा विनष्टः जातः!"
        redirect_to all_games_path
    end

    def mgameup
        game = Game.find(params[:id])
        
        # Update basic attributes
        game.update(name: params[:game][:name], info: params[:game][:info])
        
        # Attach new image if provided
        if params[:game][:image].present?
            game.image.attach(params[:game][:image])
        end
        
        # Log the change
        change = Change.new(:time => Time.now, :email => session[:email], :table => "games", :cord => "update")
        change.save
        
        flash[:notice] = "क्रीडा परिवर्तितः जातः!"
        redirect_to all_games_path
    end
end
