Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'welcome#home'

    get "user/profile", as:"profile"
    get "user/new", as:"new"
    post "user/newp", as:"newp"
    get "user/all", as:"all_users"

    get "logging/mlogin", as:"member_login"
    get "logging/ulogin", as:"user_login"
    post "logging/loginp", as:"login_post"
    get "logging/logout", as:"logout"

    get "shlok/ushlok", as:"shloks"
    get "shlok/mshlokr", as:"all_shloks"
    get "shlok/mshlokc", as:"new_shlok"
    post "shlok/mshlokcp", as:"shlok_post"
    get "shlok/:id", to:"shlok#mshloku"
    post "shlok/:id", to: "shlok#mshlokup"
    get "shlok/:id/del", to:"shlok#mshlokdp"

    get "events/uevents", as:"events"
    get "resource/firstresource", as:"resources"
end
