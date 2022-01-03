class WelcomeController < ApplicationController
    def home
        session[:visit] ||= 0
        session[:visit] += 1
        @visit = session[:visit]
    end
end
