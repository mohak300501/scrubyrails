class LoggingController < ApplicationController
    def login
        @test = params[:password]
        if params[:password] == "namaskar"
            session[:user] ||= "sc"
            redirect_to shloka_ashlokar_path
        end
    end
end
