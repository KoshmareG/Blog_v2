class ArticlesController < ApplicationController

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
    end

    def create
        @article = Article.new(article_params)
        if @article.valid?
            @article.save
            render 'create', status: :unprocessable_entity
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

    private

    def article_params
        params.require(:article).permit(:title, :text)
    end

end
