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
        link_to article.title, article_path(article.id), data: {turbo: false}, class: "link-dark", style: "text-decoration: none"
    end

    def article_author_link article
        link_to article.username, profile_path(article.user_id), class: "text-muted", style: "text-decoration: none"
    end

    def article_text_preview article
        simple_format(truncate(article.text.to_plain_text, length: 800, separator: ' ', omission: ' ... ') {link_to "Читать дальше", article_path(article.id)})
    end

    def article_edit_link
        link_to 'Редактировать', edit_article_path, class: "dropdown-item", method: :get, data: {turbo: false}
    end

    def article_delete_link
        button_to 'Удалить', article_path, class: "dropdown-item text-danger", method: :delete, form: {data: {turbo_confirm: 'Вы действительно хотите удалить статью?'}}
    end

    def create_show item
        item.created_at.strftime("%d.%m.%Y в %H:%M")
    end

    def add_user_avatar items
        items.each do |item|
            item_author = User.find(item.user_id)
            item[:avatar] = item_author.avatar.url
        end
    end

end
