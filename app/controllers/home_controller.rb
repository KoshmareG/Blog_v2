class HomeController < ApplicationController
  def index
    @articles = Article.limit(4).order 'id desc'
  end
end
