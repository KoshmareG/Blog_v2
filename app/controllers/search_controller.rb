class SearchController < ApplicationController

    def index
        if params[:request].blank?
            @result = nil
        else
            request_array = params[:request].split(/ /)

            additional_array = []

            request_array.each do |word|
                if word.size >= 6
                    additional_array << word[0, word.size - 2]
                elsif word.size >= 4 && word.size <= 5
                    additional_array << word[0, word.size - 1]                   
                end
            end

            search_array = request_array + additional_array

            search_request = search_array.map { |req| "%" + req + "%" }
            @results = Article.where("title ILIKE ANY ( array[?] )", search_request)
        end
        
    end

    private

    def search_params
        params.require(:search).permit(:request)
    end

end
