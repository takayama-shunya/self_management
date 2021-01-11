Rails.application.routes.draw do

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users

  resources :top, only: %i[ index ] 
  scope :top do

    resources :conditions
    resources :setting_records, only: %i[ index ]

    resources :integer_records, expect: %i[ index ]
    resources :decimal_records, expect: %i[ index ]
    resources :time_records, expect: %i[ index ]
    resources :check_records, expect: %i[ index ] do
      member do
        post :change_check_true
        post :change_check_false
      end
    end
    resources :count_records, expect: %i[ index ] do
      member do
        post :count_up
        post :count_down
      end
    end

    resources :condition_comments, expect: %i[ index show ]
    resources :record_comments, expect: %i[ index show ]
      
      
  end


  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
