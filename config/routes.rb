Rails.application.routes.draw do

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users

  resources :top, only: %i[ index ] 
  scope :top do
    resources :conditions
    resources :setting_records, only: %i[ index ]
    resources :integer_records,
              :decimal_records,
              :time_records,
              :count_records,
              :check_records
  end


  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
