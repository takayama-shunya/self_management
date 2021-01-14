Rails.application.routes.draw do

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users

  resources :top, only: %i[ index ] 
  scope :top do

    resources :conditions do
      resources :comments, expect: %i[ index show new ], shallow: true
    end

    resources :setting_records, only: %i[ index ]

    resources :integer_records, expect: %i[ index ] do
      resources :comments, expect: %i[ index show new ], shallow: true
    end

    resources :decimal_records, expect: %i[ index ] do
      resources :comments, expect: %i[ index show new ], shallow: true
    end

    resources :time_records, expect: %i[ index ] do
      resources :comments, expect: %i[ index show new ], shallow: true
    end

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
  end


  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
