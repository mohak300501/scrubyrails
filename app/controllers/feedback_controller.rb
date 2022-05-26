class FeedbackController < ApplicationController
    def ufeedbackp
        @feedback = Feedback.new
        @feedback.save
        redirect_to feedback_path
    end
    def ufeedback
        @feedbacks = Feedback.all
        render "ufeedback"
    end
end
