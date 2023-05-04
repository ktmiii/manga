Rails.application.routes.draw do
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  
  scope module: :public do 
    root :to => 'homes#top'
    get 'users/withdraw' => 'users#withdraw'
    patch 'users/unsubscribe' => 'users#unsubscribe'
    get 'users/mypage' => 'users#show'
    get 'users/edit' => 'users#edit'
    patch 'users/update' => 'users#update'
    
    resources :books, only: [:index, :show]
    resources :reviews
  end
  
  namespace :admin do
    root :to => 'homes#top'
    resources :users, only: [:index, :show, :update]
    resources :reviews, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
