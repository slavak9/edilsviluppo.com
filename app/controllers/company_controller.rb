class CompanyController < ApplicationController
  before_action :set_company_association_file, only: %i[ pdf_viewer ]
  def index
    @company_association_files = CompanyAssociationFile.all
    @title = "Association"
  end

  def pdf_viewer
    @title = "Viewer"
  end

  def set_company_association_file
    @company_association_file = CompanyAssociationFile.find(params[:pdf_id])
  end
end

