Rails.application.routes.draw do

  root 'welcome#home'

  # ===== USER =====
  get    "user/uprofile",                                                   as: "uprofile"
  get    "user/muserr",                                                     as: "all_users"
  post   "user/muserr",                                                     as: "user_sort"
  delete "user/:id/del",                         to: "user#muserdp",        as: "user_delete"
  get    "user/uform",                                                      as: "form"
  patch  "user/uformp",                                                     as: "form_post"

  # ===== WELCOME / NEWS =====
  get    "welcome/mhomer",                                                  as: "home"
  get    "welcome/mnewsc",                                                  as: "new_news"
  post   "welcome/mnewscp",                                                 as: "news_post"
  get    "news/:id/up",                          to: "welcome#mnewsu",      as: "news"
  patch  "news/:id",                             to: "welcome#mnewsup",     as: "news_update"
  delete "news/:id/del",                         to: "welcome#mnewsdp",     as: "news_delete"
  get    "welcome/about",                                                   as: "about"
  get    "welcome/htuse",                                                   as: "htuse"
  get    "welcome/terms",                                                   as: "terms"
  get    "welcome/maboutu",                                                 as: "about_change"
  get    "welcome/mhtuseu",                                                 as: "htuse_change"
  get    "welcome/mtermsu",                                                 as: "terms_change"
  patch  "welcome/maboutup",                                                as: "about_update"
  patch  "welcome/mhtuseup",                                                as: "htuse_update"
  patch  "welcome/mtermsup",                                                as: "terms_update"

  # ===== GAMES =====
  get    "game/ugame",                                                      as: "games"
  get    "game/uview/:id",                       to: "game#ugamen",         as: "game_uview"
  get    "game/mgamer",                                                     as: "all_games"
  get    "game/mgamec",                                                     as: "new_game"
  post   "game/mgamecp",                                                    as: "game_post"
  get    "game/:id/up",                          to: "game#mgameu",         as: "game"
  patch  "game/:id",                             to: "game#mgameup",        as: "game_update"
  delete "game/:id/del",                         to: "game#mgamedp",        as: "game_delete"

  # ===== LOGGING / AUTH =====
  get    "logging/mnew",                                                    as: "new_member"
  get    "logging/unew",                                                    as: "new_user"
  post   "logging/newp",                                                    as: "newp"
  post   "logging/otpp",                                                    as: "otpp"
  get    "logging/mlogin",                                                  as: "member_login"
  get    "logging/ulogin",                                                  as: "user_login"
  post   "logging/loginp",                                                  as: "login_post"
  get    "logging/logout",                                                  as: "logout"
  get    "logging/forgot",                                                  as: "forgot"
  post   "logging/forgotp",                                                 as: "forgotp"
  post   "logging/resetp",                                                  as: "resetp"
  get    "reset_otp",                            to: "logging#reset_otp",   as: "reset_otp"

  # ===== COURSES =====
  get    "course/ucourse",                                                  as: "courses"
  get    "course/mcourser",                                                 as: "all_courses"
  get    "course/mcoursec",                                                 as: "new_course"
  post   "course/mcoursecp",                                                as: "course_post"
  get    "course/:id/up",                        to: "course#mcourseu",     as: "course"
  patch  "course/:id",                           to: "course#mcourseup",    as: "course_update"
  delete "course/:id/del",                       to: "course#mcoursedp",    as: "course_delete"
  get    "course/:cname/uview",                  to: "course#ucourse1",     as: "course_uview"
  get    "course/:cname/reg",                    to: "course#ureg",         as: "course_reg"

  # ===== FEEDBACK =====
  get    "feedback/ufeedback",                                              as: "feedback"
  post   "feedback/ufeedbackp",                                             as: "feedback_post"
  get    "feedback/mfeedbackr",                                             as: "all_feedbacks"

  # ===== SHLOK =====
  get    "shlok/ushlok",                                                    as: "shloks"
  get    "shlok/mshlokr",                                                   as: "all_shloks"
  get    "shlok/mshlokc",                                                   as: "new_shlok"
  post   "shlok/mshlokcp",                                                  as: "shlok_post"
  get    "shlok/:id/up",                         to: "shlok#mshloku",       as: "shlok"
  patch  "shlok/:id",                            to: "shlok#mshlokup",      as: "shlok_update"
  delete "shlok/:id/del",                        to: "shlok#mshlokdp",      as: "shlok_delete"

  # ===== EVENTS =====
  get    "event/uevent",                                                    as: "events"
  get    "event/meventr",                                                   as: "all_events"
  get    "event/meventc",                                                   as: "new_event"
  post   "event/meventcp",                                                  as: "event_post"
  get    "event/:id/up",                         to: "event#meventu",       as: "event"
  patch  "event/:id",                            to: "event#meventup",      as: "event_update"
  delete "event/:id/del",                        to: "event#meventdp",      as: "event_delete"
  get    "event/uview/:id",                      to: "event#ueventn",       as: "event_uview"

  # ===== RESOURCES =====
  get    "resource/uresource",                                              as: "resources"
  get    "resource/mresourcer",                                             as: "all_resources"
  get    "resource/mresourcec",                                             as: "new_resource"
  post   "resource/mresourcecp",                                            as: "resource_post"
  get    "resource/:id/up",                      to: "resource#mresourceu", as: "resource"
  patch  "resource/:id",                         to: "resource#mresourceup",as: "resource_update"
  delete "resource/:id/del",                     to: "resource#mresourcedp",as: "resource_delete"

  # ===== EXAMS =====
  get    "exam/:cname/:ename/uview",             to: "exam#uexam1",         as: "exam_uview"
  post   "exam/:cname/:ename/upost",             to: "exam#uexamp",         as: "exam_upost"
  get    "exam/:cname/new",                      to: "exam#mexamc",         as: "exam_new"
  post   "exam/:cname/create",                   to: "exam#mexamcp",        as: "exam_create"
  get    "exam/:cname/:ename/ch",                to: "exam#mexamu",         as: "exam_change"
  patch  "exam/:cname/:ename/up",                to: "exam#mexamup",        as: "exam_update"
  delete "exam/:cname/:ename/del",               to: "exam#mexamdp",        as: "exam_delete"
  get    "exam/:cname/:ename/r",                 to: "exam#mquescr",        as: "ques_read"
  post   "exam/:cname/:ename/c",                 to: "exam#mquescr",        as: "ques_create"
  get    "exam/:cname/:ename/:qno/ch",           to: "exam#mquesu",         as: "ques_change"
  patch  "exam/:cname/:ename/:qno/up",           to: "exam#mquesup",        as: "ques_update"
  delete "exam/:cname/:ename/:qno/del",          to: "exam#mquesdp",        as: "ques_delete"
  get    "exam/:cname/:ename/re_marks",          to: "exam#re_marks",       as: "re_marks"
  get    "exam/:cname/mp_marks",                 to: "exam#mp_marks",       as: "mp_marks"

  # ===== MEMBERS =====
  get    "member/uteam",                                                    as: "members"
  get    "member/mmemberr",                                                 as: "all_members"
  get    "member/:id/up",                        to: "member#mmemberu",     as: "member"
  patch  "member/:id",                           to: "member#mmemberup",    as: "member_update"
  delete "member/:id/del",                       to: "member#mmemberdp",    as: "member_delete"
  get    "member/memarea",                                                  as: "member_area"
  get    "member/mprofile",                                                 as: "mprofile"
  get    "member/mchanger",                                                 as: "all_changes"
  get    "member/msql",                                                     as: "msql"
  post   "member/msql",                                                     as: "exec_sql"

  # ===== LIBRARY =====
  get    "library/ulibrary",                                                as: "librarys"
  get    "library/mlibraryr",                                               as: "all_librarys"
  get    "library/mlibraryc",                                               as: "new_library"
  post   "library/mlibrarycp",                                              as: "library_post"
  get    "library/:id/up",                       to: "library#mlibraryu",   as: "library"
  patch  "library/:id",                          to: "library#mlibraryup",  as: "library_update"
  delete "library/:id/del",                      to: "library#mlibrarydp",  as: "library_delete"

  # ===== TEAM =====
  get    "team/uteam",                                                      as: "teams"
  get    "team/mteamr",                                                     as: "all_teams"
  get    "team/mteamc",                                                     as: "new_team"
  post   "team/mteamcp",                                                    as: "team_post"
  get    "team/:id/up",                          to: "team#mteamu",         as: "team"
  patch  "team/:id",                             to: "team#mteamup",        as: "team_update"
  delete "team/:id/del",                         to: "team#mteamdp",        as: "team_delete"
  get    "team/mgroupr",                         to: "team#mgroup_photos",          as: "group_photos"
  post   "team/mgroupcp",                        to: "team#mgroup_photo_create",    as: "mgroup_photo_create"
  delete "team/group/:id/del",                   to: "team#mgroup_photo_delete",    as: "delete_group_photo"

  # ===== ALUMNI =====
  post   "alumni/malumnicp",                     to: "team#malumnicp",      as: "alumni_post"
  get    "alumni/:id/up",                        to: "team#malumniu",       as: "alumni"
  patch  "alumni/:id",                           to: "team#malumniup",      as: "alumni_update"
  delete "alumni/:id/del",                       to: "team#malumnidp",      as: "alumni_delete"

  # ===== SANSKRITWEEK — PUBLIC =====
# To remove: delete this entire block
get  '/sanskritweek',          to: 'sanskritweek#home',           as: 'sanskritweek'
get  '/sanskritweek/user',     to: 'sanskritweek#usanskritweek',  as: 'sanskritweek_user'
get  '/sanskritweek/user/n',   to: 'sanskritweek#usanskritweekn', as: 'sanskritweek_user_n'
get  '/sanskritweek/member',   to: 'sanskritweek#msanskritweekc', as: 'sanskritweek_member'
get  '/sanskritweek/member/r', to: 'sanskritweek#msanskritweekr', as: 'sanskritweek_member_r'
get  '/sanskritweek/member/u', to: 'sanskritweek#msanskritweeku', as: 'sanskritweek_member_u'

# ===== SANSKRITWEEK EVENTS (CRUD — member only) =====
get    'sanskritweek/events',             to: 'sanskritweek_events#index',          as: 'sw_events'
get    'sanskritweek/events/new',         to: 'sanskritweek_events#new',            as: 'sw_new_event'
post   'sanskritweek/events',             to: 'sanskritweek_events#create',         as: 'sw_create_event'
get    'sanskritweek/events/:id/edit',    to: 'sanskritweek_events#edit',           as: 'sw_edit_event'
patch  'sanskritweek/events/:id',         to: 'sanskritweek_events#update',         as: 'sw_update_event'
delete 'sanskritweek/events/:id/poster',  to: 'sanskritweek_events#destroy_poster', as: 'sw_delete_poster'
delete 'sanskritweek/events/:id',         to: 'sanskritweek_events#destroy',        as: 'sw_delete_event'
get    'sanskritweek/events/:id',         to: 'sanskritweek_events#show',           as: 'sw_event'

# ===== SANSKRITWEEK PAST EVENTS (CRUD — member only) =====
get    'sanskritweek/past',                          to: 'sanskritweek_past_events#index',         as: 'sw_past_events'
get    'sanskritweek/past/new',                      to: 'sanskritweek_past_events#new',           as: 'sw_new_past_event'
post   'sanskritweek/past',                          to: 'sanskritweek_past_events#create',        as: 'sw_create_past_event'
get    'sanskritweek/past/:id/edit',                 to: 'sanskritweek_past_events#edit',          as: 'sw_edit_past_event'
patch  'sanskritweek/past/:id',                      to: 'sanskritweek_past_events#update',        as: 'sw_update_past_event'

delete 'sanskritweek/past/:id',                      to: 'sanskritweek_past_events#destroy',       as: 'sw_delete_past_event'
get    'sanskritweek/past/:id',                      to: 'sanskritweek_past_events#show',          as: 'sw_past_event'
# Inside sanskritweek past events routes add:
get    'sanskritweek/past/:id/photos',         to: 'sanskritweek_photos#index',   as: 'sw_past_photos'
get    'sanskritweek/past/:id/photos/new',     to: 'sanskritweek_photos#new',     as: 'sw_new_past_photo'
post   'sanskritweek/past/:id/photos',         to: 'sanskritweek_photos#create',  as: 'sw_create_past_photo'
get    'sanskritweek/past/:id/photos/:photo_id/edit', to: 'sanskritweek_photos#edit', as: 'sw_edit_past_photo'
patch  'sanskritweek/past/:id/photos/:photo_id',      to: 'sanskritweek_photos#update', as: 'sw_update_past_photo'
delete 'sanskritweek/past/:id/photos/:photo_id',      to: 'sanskritweek_photos#destroy', as: 'sw_destroy_past_photo'

# ===== SANSKRITWEEK SETTINGS =====
get   'sanskritweek/settings', to: 'sanskritweek_settings#edit',   as: 'sw_settings'
patch 'sanskritweek/settings', to: 'sanskritweek_settings#update', as: 'sw_update_settings'
# ===== END SANSKRITWEEK ROUTES =====

end