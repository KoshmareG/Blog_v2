class ProfilesController < ApplicationController

    def show
        @user = User.find(params[:id])
        @articles = Article.where(user_id: @user.id).paginate(page: params[:page], per_page: 10)
    end

end
