Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'welcome#home'

    get "user/profile",                                 as:"profile"
    get "user/muserr",                                  as:"all_users"
    post "user/muserr",                                 as:"user_sort"
    delete "user/:id/del",      to:"user#muserdp",      as:"user_delete"
    get "user/uform",                                   as:"form"
    patch "user/uformp",                                as:"form_post"
    
    get "welcome/mhomer",                               as:"home"
    get "welcome/mnewsc",                               as:"new_news"
    post "welcome/mnewscp",                             as:"news_post"
    get "news/:id/up",          to:"welcome#mnewsu",    as:"news"
    patch "news/:id",           to:"welcome#mnewsup",   as:"news_update"
    delete "news/:id/del",      to:"welcome#mnewsdp",   as:"news_delete"
    get "welcome/memarea",                              as:"member_area"

    get "game/ugame",                                   as:"games"
    get "game/mgamer",                                  as:"all_games"
    get "game/mgamec",                                  as:"new_game"
    post "game/mgamecp",                                as:"game_post"
    get "game/:id/up",          to:"game#mgameu",       as:"game"
    post "game/:id",            to:"game#mgameup",      as:"game_update"
    delete "game/:id/del",      to:"game#mgamedp",      as:"game_delete"

    get "logging/mnew",                                 as:"new_member"
    get "logging/unew",                                 as:"new_user"
    post "logging/newp",                                as:"newp"
    post "logging/otpp",                                as:"otpp"
    get "logging/mlogin",                               as:"member_login"
    get "logging/ulogin",                               as:"user_login"
    post "logging/loginp",                              as:"login_post"
    get "logging/logout",                               as:"logout"

    get "course/ucourse",                               as:"courses"
    get "course/mcourser",                              as:"all_courses"
    get "course/mcoursec",                              as:"new_course"
    post "course/mcoursecp",                            as:"course_post"
    get "course/:id/up",        to:"course#mcourseu",   as:"course"
    patch "course/:id",         to:"course#mcourseup",  as:"course_update"
    delete "course/:id/del",    to:"course#mcoursedp",  as:"course_delete"
    get "course/:cname/uview",  to:"course#ucourse1",   as:"course_uview"
    get "course/:cname/reg",    to:"course#ureg",       as:"course_reg"
    # post "course/:name/reg",  to:"course#uformp"

    get "feedback/ufeedback",                           as:"feedback"
    post "feedback/ufeedbackp",                         as:"feedback_post"

    get "shlok/ushlok",                                 as:"shloks"
    get "shlok/mshlokr",                                as:"all_shloks"
    get "shlok/mshlokc",                                as:"new_shlok"
    post "shlok/mshlokcp",                              as:"shlok_post"
    get "shlok/:id/up",         to:"shlok#mshloku",     as:"shlok"
    patch "shlok/:id",          to:"shlok#mshlokup",    as:"shlok_update"
    delete "shlok/:id/del",     to:"shlok#mshlokdp",    as:"shlok_delete"

    get "event/uevent",                                 as:"events"
    get "event/meventr",                                as:"all_events"
    get "event/meventc",                                as:"new_event"
    post "event/meventcp",                              as:"event_post"
    get "event/:id/up",         to:"event#meventu",     as:"event"
    patch "event/:id",          to:"event#meventup",    as:"event_update"
    delete "event/:id/del",     to:"event#meventdp",    as:"event_delete"
    
    get "resource/uresource",                           as:"resources"
end
