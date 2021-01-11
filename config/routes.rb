Rails.application.routes.draw do

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users

  resources :top, only: %i[ index ] 
  scope :top do

    resources :conditions
    resources :setting_records, only: %i[ index ]

    resources :integer_records 
    resources :decimal_records  
    resources :time_records  
    resources :check_records do
      member do
        post :change_check_true
        post :change_check_false
      end
    end
    resources :count_records do
      member do
        post :count_up
        post :count_down
      end
    end

  end


  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
