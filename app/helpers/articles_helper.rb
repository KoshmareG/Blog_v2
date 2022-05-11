module ArticlesHelper

    def default_avatar
        image_tag(image_url("default_avatar.jpeg"), style: "width: 45px; height: 45px; object-fit: cover;", class: "articles-avatar")
    end

    def article_user_avatar
        if @article_author.avatar.present?
            image_tag(@article_author.avatar.variant(resize_to_fill: [50, 50]), class: "articles-avatar")
        else
            image_tag(image_url("default_avatar.jpeg"), size: "50x50", class: "articles-avatar")
        end
    end

    def article_user_avatar_index article
        if article.avatar.present?
            image_tag(image_url(article.avatar), style: "width: 50px; height: 50px; object-fit: cover;", class: "articles-avatar")
        else
            image_tag(image_url("default_avatar.jpeg"), style: "width: 50px; height: 50px; object-fit: cover;", class: "articles-avatar")
        end
    end

    def link_to_article article
        link_to article.title, article_path(article.id), class: "link-dark", style: "text-decoration: none"
    end

    def article_author_link article
        link_to article.username, profile_path(article.user_id), class: "text-muted", style: "text-decoration: none"
    end

    def article_text_preview article
        simple_format(truncate(article.text, length: 800, separator: ' ', omission: ' ... ') {link_to "Читать дальше", article_path(article.id)})
    end

    def article_like_button article
        if user_signed_in?
            liked = article.likes.find {|like| like.user_id == current_user.id}
            if liked
                button_to image_tag("Like.png", size: "25x25"), article_like_path(article, liked), method: :delete, class: "like-button", form_class: "like-form"
            else
                button_to image_tag("notLike.png", size: "25x25"), article_likes_path(article), method: :post, class: "like-button", form_class: "like-form"
            end
        end
    end

    def article_edit_link
        link_to 'Редактировать', edit_article_path, class: "dropdown-item", method: :get
    end

    def article_delete_link
        button_to 'Удалить', article_path, class: "dropdown-item text-danger", method: :delete, form: {data: {turbo_confirm: 'Вы действительно хотите удалить статью?'}}
    end

    def create_show item
        item.created_at.strftime("%d.%m.%Y в %H:%M")
    end

    def new_user_session
        link_to 'войти', new_user_session_url, method: :get
    end

    def new_user_registration
        link_to 'заергистрироваться', new_user_registration_url, method: :get
    end

    def comments_avatar comments
        comments.each do |comment|
            comment_author = User.find(comment.user_id)
            comment[:username] = comment_author.avatar.url
        end
    end

    def article_comment_avatar comment
        if comment.username.present?
            image_tag(image_url(comment.username), style: "width: 45px; height: 45px; object-fit: cover;", class: "articles-avatar")
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
