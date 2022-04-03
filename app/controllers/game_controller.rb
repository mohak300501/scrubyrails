class GameController < ApplicationController
    def ugame
        render "ugame"
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
            @sr = params[:id]
            @game = Game.find_by(id: @sr)
            render "mgameu"
        else
            redirect_to root_url
        end
    end

    def mgamecp
        game = Game.new(:name => params[:name], :info => params[:info])
        game.save
        flash[:notice] = "नूतनः gameH योजितः जातः!"
        redirect_to all_games_path
    end
    
    def mgamedp
        game = Game.find(params[:id])
        game.destroy
        redirect_to all_games_path
    end

    def mgameup
        game = Game.find(params[:id])
        game.update(:name => params[:name], :info => params[:info])
        flash[:notice] = "gameH परिवर्तितः जातः!"
        redirect_to all_games_path
    end
end
