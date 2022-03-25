class ArticlesController < ApplicationController

    def index
        @articles = Article.all
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

    private

    def article_params
        params.require(:article).permit(:title, :text)
    end

end
