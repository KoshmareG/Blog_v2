require "rails_helper"

RSpec.describe ArticlesHelper, type: :helper do
    describe "#link_to_article" do
        it "link to article using its id" do
            article = Article.new(id: "1", title: "Article 1", text: "Article text")
            article.save

            expect(helper.link_to_article(article)).to include("Article 1")
            expect(helper.link_to_article(article)).to include(article_path(article.id))
        end
    end
end