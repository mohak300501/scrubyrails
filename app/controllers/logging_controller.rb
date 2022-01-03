class LoggingController < ApplicationController
    def login
        if :password == "namaskar"
            session[:user] = "sc"
            puts session
            redirect_to shloka_ashlokar_path
        end
    end
end
