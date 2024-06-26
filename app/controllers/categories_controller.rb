class CategoriesController < ApplicationController
  @current_user = http_basic_authenticate_with name:"admin", password:"admin",except: []
  before_action :set_category, only: %i[ show edit update destroy ]
  

  # GET /categories or /categories.json
  def index
    @title = "Categories"
    @categories = Category.all
  end

  # GET /categories/1 or /categories/1.json
  def show
    @title = "Show Category"
  end

  # GET /categories/new
  def new
    @title = "New Category"
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @title = "Edit Category"
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: I18n.t(".mess_cat_created") }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_url, notice: I18n.t(".mess_cat_update") }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: I18n.t(".mess_cat_delete") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :description, :category_img)
    end
end
