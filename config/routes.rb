Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'welcome#home'

    get "user/uprofile",                                                    as:"uprofile"
    get "user/muserr",                                                      as:"all_users"
    post "user/muserr",                                                     as:"user_sort"
    delete "user/:id/del",                          to:"user#muserdp",      as:"user_delete"
    get "user/uform",                                                       as:"form"
    patch "user/uformp",                                                    as:"form_post"
    
    get "welcome/mhomer",                                                   as:"home"
    get "welcome/mnewsc",                                                   as:"new_news"
    post "welcome/mnewscp",                                                 as:"news_post"
    get "news/:id/up",                              to:"welcome#mnewsu",    as:"news"
    patch "news/:id",                               to:"welcome#mnewsup",   as:"news_update"
    delete "news/:id/del",                          to:"welcome#mnewsdp",   as:"news_delete"

    get "welcome/about",                                                    as:"about"
    get "welcome/htuse",                                                    as:"htuse"
    get "welcome/terms",                                                    as:"terms"
    get "welcome/maboutu",                                                  as:"about_change"
    get "welcome/mhtuseu",                                                  as:"htuse_change"
    get "welcome/mtermsu",                                                  as:"terms_change"
    patch "welcome/maboutup",                                               as:"about_update"
    patch "welcome/mhtuseup",                                               as:"htuse_update"
    patch "welcome/mtermsup",                                               as:"terms_update"

    get "game/ugame",                                                       as:"games"
    get "game/mgamer",                                                      as:"all_games"
    get "game/mgamec",                                                      as:"new_game"
    post "game/mgamecp",                                                    as:"game_post"
    get "game/:id/up",                              to:"game#mgameu",       as:"game"
    post "game/:id",                                to:"game#mgameup",      as:"game_update"
    delete "game/:id/del",                          to:"game#mgamedp",      as:"game_delete"

    get "logging/mnew",                                                     as:"new_member"
    get "logging/unew",                                                     as:"new_user"
    post "logging/newp",                                                    as:"newp"
    post "logging/otpp",                                                    as:"otpp"
    get "logging/mlogin",                                                   as:"member_login"
    get "logging/ulogin",                                                   as:"user_login"
    post "logging/loginp",                                                  as:"login_post"
    get "logging/logout",                                                   as:"logout"
    get "logging/forgot",                                                   as:"forgot"
    post "logging/forgotp",                                                 as:"forgotp"
    post "logging/resetp",                                                  as:"resetp"

    get "course/ucourse",                                                   as:"courses"
    get "course/mcourser",                                                  as:"all_courses"
    get "course/mcoursec",                                                  as:"new_course"
    post "course/mcoursecp",                                                as:"course_post"
    get "course/:id/up",                            to:"course#mcourseu",   as:"course"
    patch "course/:id",                             to:"course#mcourseup",  as:"course_update"
    delete "course/:id/del",                        to:"course#mcoursedp",  as:"course_delete"
    get "course/:cname/uview",                      to:"course#ucourse1",   as:"course_uview"
    get "course/:cname/reg",                        to:"course#ureg",       as:"course_reg"
    # post "course/:name/reg",                      to:"course#uformp"

    get "feedback/ufeedback",                                               as:"feedback"
    post "feedback/ufeedbackp",                                             as:"feedback_post"
    get "feedback/mfeedbackr",                                              as:"all_feedbacks"

    get "shlok/ushlok",                                                     as:"shloks"
    get "shlok/mshlokr",                                                    as:"all_shloks"
    get "shlok/mshlokc",                                                    as:"new_shlok"
    post "shlok/mshlokcp",                                                  as:"shlok_post"
    get "shlok/:id/up",                             to:"shlok#mshloku",     as:"shlok"
    patch "shlok/:id",                              to:"shlok#mshlokup",    as:"shlok_update"
    delete "shlok/:id/del",                         to:"shlok#mshlokdp",    as:"shlok_delete"

    get "event/uevent",                                                     as:"events"
    get "event/meventr",                                                    as:"all_events"
    get "event/meventc",                                                    as:"new_event"
    post "event/meventcp",                                                  as:"event_post"
    get "event/:id/up",                             to:"event#meventu",     as:"event"
    patch "event/:id",                              to:"event#meventup",    as:"event_update"
    delete "event/:id/del",                         to:"event#meventdp",    as:"event_delete"
    
    get "resource/uresource",                                                     as:"resources"
    get "resource/mresourcer",                                                    as:"all_resources"
    get "resource/mresourcec",                                                    as:"new_resource"
    post "resource/mresourcecp",                                                  as:"resource_post"
    get "resource/:id/up",                             to:"resource#mresourceu",     as:"resource"
    patch "resource/:id",                              to:"resource#mresourceup",    as:"resource_update"
    delete "resource/:id/del",                         to:"resource#mresourcedp",    as:"resource_delete"

    get "exam/:cname/:ename/uview",                 to:"exam#uexam1",       as:"exam_uview"
    post "exam/:cname/:ename/upost",                to:"exam#uexamp",       as:"exam_upost"
    get "exam/:cname/new",                          to:"exam#mexamc",       as:"exam_new"
    post "exam/:cname/create",                      to:"exam#mexamcp",      as:"exam_create"
    get "exam/:cname/:ename/ch",                    to:"exam#mexamu",       as:"exam_change"
    patch "exam/:cname/:ename/up",                  to:"exam#mexamup",      as:"exam_update"
    delete "exam/:cname/:ename/del",                to:"exam#mexamdp",      as:"exam_delete"
    get "exam/:cname/:ename/r",                     to:"exam#mquescr",      as:"ques_read"
    post "exam/:cname/:ename/c",                    to:"exam#mquescr",      as:"ques_create"
    get "exam/:cname/:ename/:qno/ch",               to:"exam#mquesu",       as:"ques_change"
    patch "exam/:cname/:ename/:qno/up",             to:"exam#mquesup",      as:"ques_update"
    delete "exam/:cname/:ename/:qno/del",           to:"exam#mquesdp",      as:"ques_delete"

    get "member/uteam",                                                     as:"members"
    get "member/mmemberr",                                                  as:"all_members"
    get "member/:id/up",                            to:"member#mmemberu",   as:"member"
    patch "member/:id",                             to:"member#mmemberup",  as:"member_update"
    delete "member/:id/del",                        to:"member#mmemberdp",  as:"member_delete"
    get "member/memarea",                                                   as:"member_area"
    get "member/mprofile",                                                  as:"mprofile"

    get "exam/:cname/:ename/re_marks",              to:"exam#re_marks",     as:"re_marks"
    get "exam/:cname/mp_marks",                     to:"exam#mp_marks",     as:"mp_marks"

    get "library/ulibrary",                                                 as:"books"
    get "library/mlibraryr",                                                as:"all_books"
    get "library/mlibraryc",                                                as:"new_book"
end
