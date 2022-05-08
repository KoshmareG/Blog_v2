class LikesController < ApplicationController
    before_action :like_params

    def create
        @like = @article.likes.create(user_id: current_user.id)
        render article/show
    end

    def destroy
    end

    private

    def like_params
        @article = Article.find(params[:article_id])
    end

end
