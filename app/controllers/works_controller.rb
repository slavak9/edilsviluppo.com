class WorksController < ApplicationController
  @current_user = http_basic_authenticate_with name:"admin", password:"admin",except: []
  before_action :set_work, only: %i[ show edit update destroy ]

  # GET /works or /works.json
  def index
    @title = "Works"
    @pagy, @works = pagy(Work.all)
  end

  # GET /works/1 or /works/1.json
  def show
    @title = "Show Works"
  end

  # GET /works/new
  def new
    @title = "New Works"
    @work = Work.new
  end

  # GET /works/1/edit
  def edit
    @title = "Edit Works"
  end

  # POST /works or /works.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to works_url, notice: I18n.t(".mess_work_created") }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1 or /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to works_url, notice: I18n.t(".mess_work_update") }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1 or /works/1.json
  def destroy
    @work.destroy

    respond_to do |format|
      format.html { redirect_to works_url, notice: I18n.t(".mess_work_delete") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:title, :work_img)
    end
end
