Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  resources :posts
  resources :categories
  resources :works
  resources :products
  get 'contacts'=>'contacts#index'
  get 'news'=>'news#index'
  get 'company'=>'company#index'
  get 'our_works'=>'our_works#index'
  get 'our_works/gallery'
  get 'home/gallery'
  get 'home/manage'
  get 'contacts/success'
  root 'home#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
