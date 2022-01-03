class LoggingController < ApplicationController
    def login
        @test = :password
        if :password == "namaskar"
            session[:user] ||= "sc"
            redirect_to shloka_ashlokar_path
        end
    end
end
