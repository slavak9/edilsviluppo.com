class ContactsController < ApplicationController
  def index
    @title = "Contacts"
  end

  def success
    @title = "Contacts"
  end

  # POST /categories or /categories.json
  def create
    @errors = {}
    @errors['name']= I18n.t(".error_name") if params[:ask_message][:name].strip == ''
    @errors['last_name']= I18n.t(".error_last_name") if params[:ask_message][:last_name].strip == ''
    @errors['email']= I18n.t(".error_email") if !params[:ask_message][:email].match?(/@/)
    @errors['email']= I18n.t(".error_email") if params[:ask_message][:email].strip == ''
    @errors['message']= I18n.t(".error_message") if params[:ask_message][:message].strip == ''

    respond_to do |format|
    if @errors.empty?
      MessageMailer.with(
        name: params[:ask_message][:name], last_name: params[:ask_message][:last_name],
        email: params[:ask_message][:email], message: params[:ask_message][:message]
        ).message_delivery.deliver_later
        format.html { redirect_to contacts_url, notice: I18n.t(".mess_succeeded_html") }
    else
      format.html { render :index, status: :unprocessable_entity }
      format.json { render json: @errors, status: :unprocessable_entity }
    end
    end
    @errors = {}
  end  
 
  private
  # Use callbacks to share common setup or constraints between actions.
  

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:ask_message).permit(:name, :last_name, :email, :message)
  end

end