Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'welcome#home'

    get "user/profile", as:"profile"
    get "user/muserr", as:"all_users"
    post "user/muserr", as:"user_sort"
    get "user/:id/del", to:"user#muserdp"
    get "user/uform", as:"form"
    patch "user/uformp", as:"form_post"
    
    get "welcome/mhomer", as:"home"
    get "welcome/mhomec", as:"new_announcement"
    post "welcome/mannouncementcp", as:"announcement_post"
    get "news/:id", to:"welcome#mhomeu"
    post "news/:id", to:"welcome#mannouncementup"
    get "news/:id/del", to:"welcome#mannouncementdp"
    get "welcome/memarea", as:"member_area"

    get "game/ugame", as:"games"
    get "game/mgamer", as:"all_games"
    get "game/mgamec", as:"new_game"
    post "game/mgamecp", as:"game_post"
    get "game/:id", to:"game#mgameu"
    post "game/:id", to:"game#mgameup"
    get "game/:id/del", to:"game#mgamedp"

    get "logging/mnew", as:"new_member"
    get "logging/unew", as:"new_user"
    post "logging/newp", as:"newp"
    post "logging/otpp", as:"otpp"
    get "logging/mlogin", as:"member_login"
    get "logging/ulogin", as:"user_login"
    post "logging/loginp", as:"login_post"
    get "logging/logout", as:"logout"

    get "course/ucourse", as:"courses"
    get "course/mcourser", as:"all_courses"
    get "course/mcoursec", as:"new_course"
    post "course/mcoursecp", as:"course_post"
    get "course/:id", to:"course#mcourseu"
    patch "course/:id", to:"course#mcourseup", as:"course_update"
    get "course/:id/del", to:"course#mcoursedp"
    get "course/:cname/uview", to:"course#ucourse1"
    get "course/:cname/mview", to:"course#mcourse1"
    get "course/:cname/reg", to:"course#ureg"
    # post "course/:name/reg", to:"course#uformp"

    get "feedback/ufeedback", as:"feedback"
    post "feedback/ufeedbackp", as:"feedback_post"

    get "shlok/ushlok", as:"shloks"
    get "shlok/mshlokr", as:"all_shloks"
    get "shlok/mshlokc", as:"new_shlok"
    post "shlok/mshlokcp", as:"shlok_post"
    get "shlok/:id", to:"shlok#mshloku"
    patch "shlok/:id", to:"shlok#mshlokup", as:"shlok_update"
    get "shlok/:id/del", to:"shlok#mshlokdp"

    get "event/uevent", as:"events"
    get "event/meventr", as:"all_events"
    get "event/meventc", as:"new_event"
    post "event/meventcp", as:"event_post"
    get "event/:id", to:"event#meventu"
    patch "event/:id", to:"event#meventup", as:"event_update"
    get "event/:id/del", to:"event#meventdp"
    
    get "resource/uresource", as:"resources"
end
