Rails.application.routes.draw do

  devise_scope :user do
    root :to => "devise/sessions#new"
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'  
  end

  devise_for :users

  resources :top, only: %i[ index ]
  scope :top do

    concern :comments do
      resources :comments, expect: %i[ index show new ], shallow: true
    end

    resources :conditions, concerns: :comments

    resources :setting_records, only: %i[ index ] 

    resources :integer_records, expect: %i[ index ], concerns: :comments

    resources :decimal_records, expect: %i[ index ], concerns: :comments

    resources :time_records, expect: %i[ index ], concerns: :comments

    resources :check_records, expect: %i[ index ] do
      member do
        post :change_check_true
        post :change_check_false
      end
      resources :comments, expect: %i[ index show new ], shallow: true
    end

    resources :count_records, expect: %i[ index ] do
      member do
        post :count_up
        post :count_down
      end
      resources :comments, expect: %i[ index show new ], shallow: true
    end

    resources :automatic_records, only: %i[ index ] do
      collection do
        post :sleep_improvement_plan
      end
    end

  end

  
  # mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
