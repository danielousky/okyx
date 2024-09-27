class InicioController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  layout 'outside'
  def index
    reset_session
  end
end
