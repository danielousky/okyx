class InicioController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  layout 'outside'
  def index
    if params[:search] or params[:area_id] or params[:location]

      @services = params[:area_id] ? Area.where(id: params[:area_id].to_s).first&.services : Service.all

      @services = @services.by_state params[:location] if params[:location]
      @services = @services.search_by params[:search] if params[:search]

    else
      reset_session
    end
  end
end
