class SearchController < ApplicationController

    def index
        if params[:request].blank?
            @result = nil
        else
            @results = Article.where("(title) LIKE :q", q: "%" + params[:request] + "%")
        end
        
    end

    private

    def search_params
        params.require(:search).permit(:request)
    end

end
