class ProfilesController < ApplicationController

    def show
        @user = User.find(params[:id])
        @articles = Article.where(user_id: @user.id)
    end

end
