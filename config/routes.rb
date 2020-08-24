Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'tests', to: 'tests#index'
      get 'char_classes', to: 'char_classes#index'
      get 'sub_char_classes', to: 'sub_char_classes#index'
    end
  end
  # Route/controller for simple select dropdown data queries
  resources :selects, only: :index
  # resources :char_classes

  # get '*path', to: 'application#frontend_index_html', constraints: lambda { |request|
  #     !request.xhr? && request.format.html?
  #   }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
