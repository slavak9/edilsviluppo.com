class PostsController < ApplicationController
  @current_user = http_basic_authenticate_with name:"admin", password:"admin",except: []
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @title = "Posts"
    @pagy, @posts = pagy(Post.all)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @title = "Show Post"
  end

  # GET /posts/new
  def new
    @works = Work.all
    @title = "New Post"
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @title = "Edit Post"
    @works = Work.all
  end

  # POST /posts or /posts.json
  def create
    
    @works = Work.all
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_url, notice: I18n.t(".mess_post_created") }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_url, notice: I18n.t(".mess_post_update") }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: I18n.t(".mess_post_delete") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:description, :work_id, :post_img)
    end
end
