Rails.application.routes.draw do
  root 'main_page#show'
  get 'mashup', to: 'mashup#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
