Rails.application.routes.draw do
  get 'stations/:abbr', to: 'stations#show_by_abbr', 
      constraints: { abbr: /[a-zA-Z]+/ }, via: :get
  resources :stations, 
            except: [:new, :edit],
            contraints: { format: 'json'}
  get 'arrivals/:station' => 'arrivals#show'
  root 'stations#index'
end
