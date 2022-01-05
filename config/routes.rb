Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get "logging/login"
  post "logging/loginp"
  get "logging/logout"

  get "shloks", to:"shlok#rshlok"
  get "shlok/ashlokr"
  get "shlok/ashlokc"
  post "shlok/ashlokcp"
  get "shlokupdate/:id", to:"shlok#ashloku"
  update "shlokupdate/:id", to: "shlok#ashlokup"
  delete "shlokdelete/:id", to:"shlok#ashlokdp"

  get "events", to:"events/revents"
  get "resource/firstresource"
end
