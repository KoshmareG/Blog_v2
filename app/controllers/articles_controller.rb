class ArticlesController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

    def index
        @articles = Article.order 'id desc'
    end

    def show
        @article = Article.find(params[:id])
        @comments = @article.comments.where.not(id: nil)
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
