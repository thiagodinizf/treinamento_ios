module Api::V1
  class ContactsController < ApiController

  before_action :set_contact, only: [:update, :destroy]
  before_action :authenticate_api_v1_user!

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.where(user_id: current_api_v1_user.id)
    render json: @contacts, root: "data", adapter: :json, status: :ok
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
        render json: @contact, root: "data", adapter: :json, status: :created
    else
        render json: {errors: {full_messages: error_messages(@contact)}}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
        render json: @contact, root: "data", adapter: :json, status: :ok
    else
        render json: {errors: {full_messages: error_messages(@contact)}}, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    render json: @contact, root: "data", status: :ok
  end

  private

    def error_messages(contact)
      messages = []
      contact.errors.messages.each do |k,v| 
        messages.push("#{t("activerecord.attributes.contact.#{k}")} #{v[0]}")
      end
      messages
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
       params.require(:contact).permit(:id, :name, :nickname, :birth_date, :email, :phone_number, :nickname, :user_id, :image_url)
    end

  end
end