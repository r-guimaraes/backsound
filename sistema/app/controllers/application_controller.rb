class ApplicationController < ActionController::Base
    before_action :set_variables

    def set_variables
        @slogan = "O melhor DJ é a galera"
    end
end
