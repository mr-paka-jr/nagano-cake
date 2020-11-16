Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}
  namespace :admins do
    resources :customers,only: [:index,:show,:edit,:update]
    get 'top'=>'customers#top'
  	resources :items,only: [:index,:new,:create,:show,:edit,:update]
  	resources :genres,only: [:index,:create,:edit,:update]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
        resource :order_details,only: [:update]
      end
    end
  end

  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations'
}
  root 'customers/items#top'
  get 'about' => 'customer/items#about'

  scope module: :customer do
    resources :items,only: [:index,:show]
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items,only: [:index,:update,:create,:destroy] do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end
    resources :orders,only: [:index,:new,:create,:show] do
      collection do
        post 'comfirm'
        get 'thanks'
      end
    end
    resource :customers,only: [:show] do
  		collection do
  	    get 'withdrawal'
  	    patch 'change'
  	  end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
