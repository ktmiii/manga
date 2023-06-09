Rails.application.routes.draw do
  namespace :public do
    get 'relationships/followings'
    get 'relationships/followers'
  end
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  scope module: :public do
    root :to => 'homes#top'

    get 'users/withdraw' => 'users#withdraw'
    patch 'users/unsubscribe' => 'users#unsubscribe'
    post 'reviews/confirm' => 'reviews#confirm'
    get 'reviews/confirm' => 'reviews#confirm'
    get 'reviews/complete' => 'reviews#complete'


    resources :books, only: [:index, :show]
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
    end
    resources :reviews, only: [:new, :create, :index, :destroy] do
      resource :review_likes, only: [:create, :destroy]
    end

    resources :books, except: [:index] do
      resource :bookmarks, only: [:create, :destroy]
    end
  end

  namespace :admin do
    root :to => 'users#index'
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
