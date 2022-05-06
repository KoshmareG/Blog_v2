class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    I18n.load_path << Dir[File.expand_path("config/locales") + "/*.yml"]
    I18n.default_locale = :ru

    private

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

end
