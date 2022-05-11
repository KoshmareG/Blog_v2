module ProfilesHelper

    def user_avatar
        if @user.avatar.present?
            image_tag(@user.avatar.variant(resize_to_fill: [120, 120]), class: "avatar-profile-style")
        else
            link_to image_tag("default_avatar.jpeg", size: "120x120", class: "avatar-profile-style"), root_path
        end
    end

    def delete_account_button
        button_to "Настройки аккаунта", edit_user_registration_url, class: "btn btn-outline-secondary btn-sm", method: :get
    end

    def article_title article
        link_to article.title, article_path(article.id), class: "link-dark", style: "text-decoration: none"
    end

    def link_to_edit_article
        link_to 'Редактировать', edit_article_path, class: "dropdown-item", method: :get
    end

    def delete_article_button
        button_to 'Удалить', article_path, class: "dropdown-item text-danger", method: :delete, form: {data: {turbo_confirm: 'Вы действительно хотите удалить статью?'}}
    end

end
