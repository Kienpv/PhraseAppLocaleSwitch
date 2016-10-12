Rails.application.routes.draw do
  scope "(:locale)", locale: /en|pl/ do
    get '/about', to: 'pages#about', as: :about
    root 'pages#index'
  end
end
