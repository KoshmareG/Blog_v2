module ArticlesHelper

    def child_comments_avatar
        @child_comments.each do |child_comment|
            comment_author = User.find(child_comment.user_id)
            child_comment[:username] = comment_author.avatar.url
        end
    end

end
