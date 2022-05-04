class ArticlesController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
    before_action do
        ActiveStorage::Current.host = request.base_url
      end

    def index
        @articles = Article.order 'id desc'

        @articles.each do |article|
            article_author = User.find(article.user_id)
            article[:avatar] = article_author.avatar.url
        end
    end

    def show
        @article = Article.find(params[:id])
        @comments = @article.comments.where.not(id: nil)
        @article_author = User.find(@article.user_id)
        
        @comments.each do |comment|
            comment_author = User.find(comment.user_id)
            comment[:username] = comment_author.avatar.url
        end
    end

    def new
    end

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        @article.username = current_user.username
        if @article.valid?
            @article.save
            redirect_to article_path(@article)
        else
            render action: "new", status: :unprocessable_entity
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        @article.update(title: params[:article][:title], text: params[:article][:text])
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :text)
    end

end
