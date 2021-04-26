Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
   namespace :v1 do
     get 'forecast', to: 'weather#show'

     get 'background', to: 'background#show'

     get 'salaries', to: 'salarie#show'
   end
 end
end
