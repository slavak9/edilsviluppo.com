Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
  resources :posts
  resources :categories
  resources :works
  resources :products
  resources :company_association_files
  resources :contacts
  
  get 'news'=>'news#index'
  get 'company'=>'company#index'
  get 'our_works'=>'our_works#index'
  get 'company/pdf_viewer'
  get 'our_works/gallery'
  get 'home/gallery'
  get 'home/manage'
  get 'contacts/success'
  root 'home#index'
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # match '*path', to: redirect('/'), via: :all
  # Defines the root path route ("/")
  # root "articles#index"
end
