Rails.application.routes.draw do
  resources :reports
  resources :journal_entries
  resources :children
  resources :parents
  post '/login', to: 'auth#create'
  post '/parentLogin', to: 'auth#create_parent'
  # get '/children/:id/reports', to: 'children#reports'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
