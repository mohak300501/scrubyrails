Rails.application.routes.draw do
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root 'welcome#home'

    get "logging/mlogin", as:"member_login"
    get "logging/ulogin", as:"user_login"
    post "logging/loginp"
    get "logging/logout"

    get "shlok/ushlok", as:"shloks"
    get "shlok/mshlokr", as:"all_shloks"
    get "shlok/mshlokc", as:"new_shlok"
    post "shlok/mshlokcp"
    get "shlok/:id", to:"shlok#mshloku", as:"update_shlok"
    post "shlok/:id", to: "shlok#mshlokup"
    get "shlok/:id/del", to:"shlok#mshlokdp"

    get "events/uevents", as:"events"
    get "resource/firstresource", as:"resources"
end
