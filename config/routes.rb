Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get "logging/login"
  post "logging/loginp"
  get "logging/logout"

  get "shlok/ushlok"
  get "shlok/mshlokr"
  get "shlok/mshlokc"
  post "shlok/mshlokcp"
  get "shlok/:id", to:"shlok#mshloku"
  post "shlok/:id", to: "shlok#mshlokup"
  get "shlok/:id/del", to:"shlok#mshlokdp"

  get "events/uevents"
  get "resource/firstresource"
end
