Rails.application.routes.draw do

  get 'relationships/connect_user'

  get 'relationships/disconnect_user'

  get 'notifications/link_through'

  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
    resources :comments
    member do
      get 'like'
    end
  end
  root 'posts#index'

  get ':user_name', to: 'profiles#show', as: :profile

  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile

  patch ':user_name/edit', to: 'profiles#update', as: :update_profile

  get 'notifications/:id/link_through', to: 'notifications#link_through', as: :link_through

  post ':user/connect_user', to: 'relationships#connect_user', as: :connect_user

  post ':user_name/disconnect_user', to: 'relationships#disconnect_user', as: :disconnect_user

  get 'browse', to: 'posts#browse', as: :browse_posts


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
