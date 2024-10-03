class InicioController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  layout 'outside'
  def index
    if params[:search] or params[:area_id]

      @services = params[:area_id] ? Area.where(id: params[:area_id].to_s).first&.services : Service.all

      @services = @services.search_by params[:search] if params[:search]

    else
      reset_session
    end
  end
end
