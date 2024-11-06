class InicioController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  layout 'outside'
  def index
    if params[:search] or params[:area_id] or params[:location]

      @services = params[:area_id].blank? ? Service.all : Area.where(id: params[:area_id].to_s).first&.services

      @services = @services.by_state params[:location] if params[:location]
      @services = @services.search_by params[:search] if params[:search]

      if @services.any?
        if @services.count > 20
          flash[:success] = " ¡Más de 20 resultados encontrados! Con el filtro, puedes ser más específico para encontrar el servicio que necesitas!"
        else
          flash[:success] = "#{@services.count} #{'resultado'.pluralize(@services.count)} #{'encontrado'.pluralize(@services.count)}!"
        end
      else
        flash[:danger] = "#{@services.count} #{'resultado'.pluralize(@services.count)} #{'encontrado'.pluralize(@services.count)}. Por favor, intente buscando con otra palabra clave"
      end
      @services = @services.limit(10)
      
    else
      reset_session
    end
  end
end
