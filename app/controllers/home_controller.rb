class HomeController < ApplicationController
  @current_user = http_basic_authenticate_with name:"admin", password:"admin",except: [:index, :gallery]
  before_action :set_product, only: %i[ gallery ]
  def index
    @pagy, @categories = pagy(Category.all)
    @title = "Home"
  end

  def manage
    @title = "Manage"
  end

  def gallery
  end

  def set_product
    @pagy, @product = pagy(Product.where(category_id: params[:cat_id]))
    @cat_title = Category.find(params[:cat_id])
    @title = "Gallery"
  end

end
