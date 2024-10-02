class InicioController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  layout 'outside'
  def index
    if params[:search]
      @services = Service.where("name ILIKE '%#{params[:search]}%' OR details ILIKE '%#{params[:search]}%'")
    else
      reset_session
    end
  end
end
