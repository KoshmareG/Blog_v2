module SearchHelper

    def user_search_avatar user
        if user.avatar.present?
            image_tag(user.avatar, style: "width: 35px; height: 35px; object-fit: cover;", class: "articles-avatar")
        else
            image_tag(image_url("default_avatar.jpeg"), style: "width: 35px; height: 35px; object-fit: cover;", class: "articles-avatar")
        end
    end

    def user_search_link user
        link_to user.username, profile_path(user.id), data: {turbo: false}, class: "text-muted", style: "text-decoration: none"
    end

end
