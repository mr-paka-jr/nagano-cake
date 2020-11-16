Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations'
}


  root 'customers/items#top'
  get 'about' => 'customers/items#about'

  scope module: :customers do
    resources :items,only: [:index,:show]
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items,only: [:index,:update,:create,:destroy] do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end
    resources :orders,only: [:index,:new,:create,:show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
  end
  
  resources :customers,only: [:show, :edit, :update] do
  	member do
      get 'withdrawal'
      patch 'change'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
