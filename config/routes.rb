Rails.application.routes.draw do

  root 'public/homes#top'
  get 'public/users/:id/withdraw' => 'public/users#withdraw', as: 'withdraw_public_user'
  get 'public/hope_questions/thanks' => 'public/hope_questions#thanks', as: 'thanks_public_hope_question'
  get 'public/relationships/follow' => 'public/relationships#follow', as: 'follow_public_relationship'
  get 'public/relationships/follower' => 'public/relationships#follower', as: 'follower_public_relationship'
  get 'public/homes/top' => 'public/homes#top', as: 'top_public_home'
  get 'public/homes/about' => 'public/homes#about', as: 'about_public_home'
  get 'public/metoos/index' => 'public/metoos#index', as: 'index_public_metoo'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
}
  devise_for :users

    namespace :public do
      resources :users,only: [:index,:show,:edit,:update,:destroy]
      resources :questions,only: [:index] do
       resources :answers,only: [:new,:edit,:create,:update,:destroy] do
       resources :metoos,only: [:show,:create,:destroy]
      end
      end
      resources :hope_questions,only: [:new,:index,:create,:destroy] do
      	resource :agrees,only: [:create,:destroy]
      end
      resources :relationships,only: [:create,:destroy]
      resources :searchs,only: [:index]
    end


    namespace :admin do
      resources :users,only: [:index,:show,:update]
      resources :questions,only: [:new,:index,:edit,:create,:update,:destroy] do
        resources :answers,only: [:destroy]
      end
      resources :hope_questions,only: [:index,:destroy]
      resources :searchs,only: [:index]
    end


end