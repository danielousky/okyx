class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show edit update destroy ]
  before_action :verify_data!, except: %i[ new create ]

  # GET /services or /services.json
  def index
    @services = current_user&.client ? current_user&.client&.services : Service.all
    @services = @services.by_state(params[:state]) if params[:state]
  end

  # GET /services/1 or /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
    @service.location = params[:state] if params[:state]
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services or /services.json
  def create
  
    @service = Service.new(service_params)
    continue = true
    if params[:user]
      @user = User.where(id: params[:user][:id]).first
      @service.client_id = @user&.client&.id
      if @user
        continue = @user.update(first_name: params[:user][:first_name], last_name: params[:user][:last_name])
      end
    end


    respond_to do |format|
      if continue and @service.save
        format.html { redirect_to service_url(@service), notice: "Su solicitud de servicio fue gestionada exitosamente." }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1 or /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        
        format.html { redirect_to service_url(@service), notice: "Servicio Actualizado." }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1 or /services/1.json
  def destroy
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url, notice: "Servicio Eliminado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:condition, :code, :name, :details, :link, :contact_phone, :contact_phone_code, :location, :profile, :conditions_accepted, area_ids: [])
    end
end
