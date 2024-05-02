class CompanyAssociationFilesController < ApplicationController
  @current_user = http_basic_authenticate_with name:"admin", password:"admin",except: []
  before_action :set_company_association_file, only: %i[ show edit update destroy ]

  # GET /company_association_files or /company_association_files.json
  def index
    @title = "Partners"
    @pagy, @company_association_files = pagy(CompanyAssociationFile.all)
  end

  # GET /company_association_files/1 or /company_association_files/1.json
  def show
    @title = "Show partner"
  end

  # GET /company_association_files/new
  def new
    @title = "New partner"
    @company_association_file = CompanyAssociationFile.new
  end

  # GET /company_association_files/1/edit
  def edit
    @title = "Edit partner"
  end

  # POST /company_association_files or /company_association_files.json
  def create
    @company_association_file = CompanyAssociationFile.new(company_association_file_params)

    respond_to do |format|
      if @company_association_file.save
        format.html { redirect_to company_association_files_url, notice: I18n.t(".mess_cat_created") }
        format.json { render :show, status: :created, location: @company_association_file }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_association_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_association_files/1 or /company_association_files/1.json
  def update
    respond_to do |format|
      if @company_association_file.update(company_association_file_params)
        format.html { redirect_to company_association_files_url, notice: I18n.t(".mess_par_update") }
        format.json { render :show, status: :ok, location: @company_association_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_association_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_association_files/1 or /company_association_files/1.json
  def destroy
    @company_association_file.destroy

    respond_to do |format|
      format.html { redirect_to company_association_files_url, notice: I18n.t(".mess_par_delete") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_association_file
      @company_association_file = CompanyAssociationFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_association_file_params
      params.require(:company_association_file).permit(:description, :company_img, :pdf)
    end
end
