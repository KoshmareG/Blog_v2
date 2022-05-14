module Users::DeviseHelper

    def new_user_session
        link_to 'войти', new_user_session_url, method: :get, data: {turbo: false}
    end

    def new_user_registration
        link_to 'заергистрироваться', new_user_registration_url, method: :get, data: {turbo: false}
    end

end
