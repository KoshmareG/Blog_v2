module ApplicationHelper

    def default_avatar_navbar
        button_to image_tag("default_avatar.jpeg", size: "30x30", class: "avatar-navbar-style"), root_path, class: "profile-button"
    end

    def link_to_home
        link_to 'Главная', home_index_url, class: "nav-link active mx-auto text-center"
    end

    def link_to_feed
        link_to 'Лента', articles_path, class: "nav-link active mx-auto text-center"
    end

    def link_to_new_article
        link_to 'Новая статья', new_article_url, class: "nav-link active mx-auto text-center"
    end

    def link_to_terms
        link_to 'Соглашение', terms_url, class: "nav-link active mx-auto text-center"
    end

    def user_avatar_navbar
        if current_user.avatar.present?
            button_tag image_tag(current_user.avatar.variant(resize_to_fill: [30, 30]), class: "avatar-navbar-style"), class: "profile-button"
        else
            default_avatar_navbar
        end
    end

    def link_to_user_profile
        link_to 'Мой профиль', profile_path(current_user.id), class: "link-light lh-base", style: "text-decoration: none"
    end

    def link_to_destroy_user_session
        link_to 'Выйти', destroy_user_session_url, data: { turbo_method: :delete }, class: "link-light lh-base", style: "text-decoration: none"
    end

    def link_to_new_destroy_user_session_url
        link_to 'Вход', new_user_session_url, method: :get, class: "link-light lh-base", style: "text-decoration: none"
    end

    def link_to_new_destroy_user_session
        link_to "Регистрация", new_user_registration_url, class: "link-light lh-base", style: "text-decoration: none"
    end

end
