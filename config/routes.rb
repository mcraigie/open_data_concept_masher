Rails.application.routes.draw do
  root 'main_page#random'
  get 'random', to: 'main_page#random'
  get 'mashup', to: 'main_page#mashup'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
