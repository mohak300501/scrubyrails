class LoggingController < ApplicationController
    if :password == "namaskar"
        session[:user] = "sc"
        redirect_to root_url
    end
end
