Rails.application.routes.draw do

  devise_scope :user do
    root :to => "devise/sessions#new"
  end

  devise_for :users


  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
