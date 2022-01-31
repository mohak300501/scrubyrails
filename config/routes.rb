Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'welcome#home'

    get "user/profile", as:"profile"
    get "user/new", as:"new"
    post "user/newp", as:"newp"
    get "user/muserr", as:"all_users"
    
    get "welcome/mhomer", as:"all_homes"

    get "logging/mlogin", as:"member_login"
    get "logging/ulogin", as:"user_login"
    post "logging/loginp", as:"login_post"
    get "logging/logout", as:"logout"

    get "course/ucourse", as:"courses"
    get "course/mcourser", as:"all_courses"
    get "course/mcoursec", as:"new_course"
    post "course/mcoursecp", as:"course_post"

    get "feedback/ufeedback", as:"feedback"
    post "feedback/ufeedbackp", as:"feedback_post"

    get "shlok/ushlok", as:"shloks"
    get "shlok/mshlokr", as:"all_shloks"
    get "shlok/mshlokc", as:"new_shlok"
    post "shlok/mshlokcp", as:"shlok_post"
    get "shlok/:id", to:"shlok#mshloku"
    post "shlok/:id", to: "shlok#mshlokup"
    get "shlok/:id/del", to:"shlok#mshlokdp"

    get "event/uevent", as:"events"
    get "resource/uresource", as:"resources"
end
