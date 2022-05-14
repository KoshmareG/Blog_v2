module CommentsHelper

    def article_comment_avatar comment
        if comment.avatar.present?
            image_tag(image_url(comment.avatar), style: "width: 45px; height: 45px; object-fit: cover;", class: "articles-avatar")
        else
            default_avatar
        end
    end

    def comment_author_link comment
        link_to comment.author, profile_path(comment.user_id), style: "text-decoration: none; color: black"
    end

    def delete_comment_button comment
        button_to 'Удалить', [@article, comment], class: "delete-link", method: :delete, form: {data: {turbo_confirm: 'Вы действительно хотите удалить комментарий?'}}
    end

    def current_user_avatar
        if current_user.avatar.present?
            image_tag(current_user.avatar.variant(resize_to_fill: [45, 45]), class: "articles-avatar")
        else
            default_avatar
        end
    end
    
end
