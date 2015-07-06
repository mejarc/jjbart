Rails.application.routes.draw do
  resources :stations, except: [:new, :edit]
  get 'arrivals/:station' => 'arrivals#show'
  resources :stations, contraints: { format: 'json'}
  root 'stations#index'
end
