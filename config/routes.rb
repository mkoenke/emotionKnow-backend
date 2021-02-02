Rails.application.routes.draw do
  get "children/:id/reports", to: "children#reports"
  resources :video_reports
  resources :audio_reports
  resources :video_entries
  resources :audio_entries
  resources :reports
  resources :journal_entries
  resources :children
  resources :parents
  post '/login', to: 'auth#create'
  post '/parentLogin', to: 'auth#create_parent'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
