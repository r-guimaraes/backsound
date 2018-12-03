class ApplicationController < ActionController::Base
    before_action :set_variables
	before_action :configure_permitted_parameters, if: :devise_controller?

    def set_variables
        @slogan = "O melhor DJ é a galera"
    end

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])	    
	 end
end
