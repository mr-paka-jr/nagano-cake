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
        resource :order_detail,only: [:update]
      end
    end
    get 'search' => 'search#search'
  end

  devise_for :customers, controllers: {
  sessions: 'customers/sessions',
  registrations: 'customers/registrations'
}
  root 'customers/items#top'
  get 'about' => 'customers/items#about'

  namespace :customers do
    resources :items,only: [:index,:show]
    resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_items,only: [:index, :create] do
      member do
        delete '/' => 'cart_items#destroy'
        put '/' => 'cart_items#update', as: 'update'
        patch '/' => 'cart_items#update'
      end
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
        patch 'withdrawal' => 'customers#change', as: "change"
      end
  	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
