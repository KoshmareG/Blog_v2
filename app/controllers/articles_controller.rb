class ArticlesController < ApplicationController
    before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

    before_action do
        ActiveStorage::Current.host = request.base_url
    end

    before_action :only => [:show, :edit, :update, :destroy] do
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 10)

        @articles.each do |article|
            article_author = User.find(article.user_id)
            article[:avatar] = article_author.avatar.url
        end
    end

    def show
        @number_of_comments = @article.comments.size
        @comments = @article.comments.where(parent: nil).paginate(page: params[:page], per_page: 10)
        @child_comments_raw = @article.comments.where.not(parent: nil)
        @article_author = User.find(@article.user_id)
    end

    def new
        @article = Article.new
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
    end

    def update
        if @article.update(title: params[:article][:title], text: params[:article][:text])
            redirect_to article_path(@article)
        else
            render action: "edit", status: :unprocessable_entity
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private

    def article_params
        params.require(:article).permit(:title, :text)
    end

end
