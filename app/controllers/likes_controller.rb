class LikesController < ApplicationController
    before_action :like_params

    def create
        @like = @article.likes.create(user_id: current_user.id)

        redirect_to article_path(@article)
    end

    def destroy
        @like = @article.likes.find(params[:id])
        @like.destroy

        redirect_to article_path(@article)
    end

    private

    def like_params
        @article = Article.find(params[:article_id])
    end

end
