Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  get "logging/login"
  post "logging/loginp"
  get "logging/logout"
  get "shloka/rshloka"
  get "shloka/ashlokar"
  get "shloka/ashlokac"
  post "shloka/ashlokacp"
  get "events/revents"
  get "resource/firstresource"
end
