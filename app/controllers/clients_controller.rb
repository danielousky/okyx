class ClientsController < ApplicationController
  before_action :set_client, only: %i[ edit update ]
  
  # GET /clients or /clients.json
#   def index
#     @clients = client.all
#   end

  # GET /clients/1 or /clients/1.json
#   def show
#     # @services = @client.services
#   end

  # GET /clients/new
#   def new
#     @client = client.new
#   end

  # GET /clients/1/edit
  def edit
    @user = @client.user
  end

  # POST /clients or /clients.json
#   def create
#     @client = client.new(client_params)

#     respond_to do |format|
#       if @client.save
#         format.html { redirect_to area_url(@client), notice: "Area was successfully created." }
#         format.json { render :show, status: :created, location: @client }
#       else
#         format.html { render :new, status: :unprocessable_entity }
#         format.json { render json: @client.errors, status: :unprocessable_entity }
#       end
#     end
#   end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|

      if @client.update(client_params)

        format.html { redirect_to session_dashboard_path, notice: "Area was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

#   # DELETE /clients/1 or /clients/1.json
#   def destroy
#     @client.destroy

#     respond_to do |format|
#       format.html { redirect_to clients_url, notice: "Area was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.where(user_id: params[:id]).first
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:user_id, user_attributes: [:id, :email, :first_name, :last_name, :number_phone])
    end
    
    # def user_params
    #   params.require(:user).permit(:email, :first_name, :last_name, :number_phone, :profile)
    # end
end
