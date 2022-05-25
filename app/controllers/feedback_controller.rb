class FeedbackController < ApplicationController
    def ufeedbackp
        redirect_to feedback_path
    end
    def ufeedback
        @feedbacks = Feedback.all
        render "ufeedback"
    end
end
