Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :stores, except: [:new, :edit] do
        resources :products, except: [:new, :edit, :update] do
          member do
            put '/inventory', to: 'products#update'
            patch '/inventory', to: 'products#update'
          end
        end
      end
    end
  end
end
