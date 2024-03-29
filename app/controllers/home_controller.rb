class HomeController < ApplicationController
  @current_user = http_basic_authenticate_with name:"admin", password:"admin",except: [:index, :gallery]
  before_action :set_post, only: %i[ gallery ]
  def index
    @categories = Category.all
    @title = "Home"
  end

  def manage
    @title = "Manage"
  end

  def gallery
  end

  def set_post
    @product = Product.where(category_id: params[:cat_id])
    @cat_title = Category.find(params[:cat_id])
    @title = "Gallery"
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :category_id,:post_img)
  end
end
