class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    def after_sign_in_path_for(resource)
        session_dashboard_path
    end

    def current_sing_in_admin
        unless current_user.admin
            flash[:danger] = '¡Acceso Restringido!'
            redirect_to session_dashboard_path
        end
    end

    def verify_data!
        if current_user&.data_incompleted?
            flash[:danger] = 'Faltan algunos datos por completar su registro. Por favor, complete la información solicitada'
            redirect_to edit_client_path(current_user) 
        end    
    end

end
