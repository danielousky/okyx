class RegistrationsController < Devise::RegistrationsController
  def create
    super

    # if Period.open_enrollment_leveling.any? or Period.open_enrollment_new.any?
    #   super
    # else
    #   msg = "En estos momentos los nuevos registros no están habilitados. </br> Podrás registrarte e inscribirte durante las fechas publicadas en <a href='fundeim.com/inscripciones'>fundeim.com</a> o en nuestras redes sociales. </br> ¡Deseamos que tengas un excelente día!"
    #   redirect_back fallback_location: root_path, flash: {danger: msg}
    # end
  end

  protected

  def after_sign_up_path_for(resource)
    Client.create(user_id: resource.id)
  	# if params[:student] and Student.create(user_id: resource.id)

  	# 	student_session_index_path
  	# else
  	# 	flash[:danger] = "Error al intentar registrar el estudiante. Por favor dirígete a los administradores del sistema"
  	# 	redirect_back fallback_location: root
  	# end
  end
end