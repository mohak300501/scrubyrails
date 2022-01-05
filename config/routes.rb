Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'

  get "logging/login"
  post "logging/loginp"
  get "logging/logout"

  get "shlok/rshlok"
  get "shlok/ashlokr"
  get "shlok/ashlokc"
  post "shlok/ashlokcp"
  get "shlok/ashloku/:id"
  post "shlok/ashlokup/:id"
  post "shlok/ashlokdp/:id"

  get "events/revents"
  get "resource/firstresource"
end
