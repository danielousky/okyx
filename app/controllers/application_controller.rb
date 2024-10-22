class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_paper_trail_whodunnit

    helper_method :current_admin
    def after_sign_in_path_for(resource)
        session_dashboard_path
    end

    def current_admin
        current_user&.admin
    end
    def current_sing_in_admin
        unless current_user.admin
            flash[:danger] = '¡Acceso Restringido!'
            redirect_to session_dashboard_path
        end
    end

    def current_sing_in_superadmin
        unless current_user&.admin&.is_boss?
            flash[:danger] = '¡Acceso Restringido!'
            redirect_to session_dashboard_path
        end
    end

    def verify_data!
        if current_user&.data_incompleted?
            flash[:warning] = 'Faltan algunos datos por completar su registro. Por favor, complete la información solicitada'
            redirect_to edit_client_path(current_user) 
        end    
    end

end
