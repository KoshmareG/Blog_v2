class SearchController < ApplicationController

    def index
        if params[:request].blank?
            @result = nil
        else
            search_array = params[:request].split(/ /)
            search_request = search_array.map { |req| "%" + req + "%" }
            @results = Article.where("title ILIKE ANY ( array[?] )", search_request)
        end
        
    end

    private

    def search_params
        params.require(:search).permit(:request)
    end

end
