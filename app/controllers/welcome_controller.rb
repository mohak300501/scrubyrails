class WelcomeController < ApplicationController
    def home
        @visit = session[:visit]
    end
end
