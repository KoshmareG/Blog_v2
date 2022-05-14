module LikesHelper

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

end
