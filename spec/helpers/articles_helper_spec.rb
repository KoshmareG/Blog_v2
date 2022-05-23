require "rails_helper"

def create_test_article
    @article = Article.new(id: "1", title: "Article 1", text: "Article text", user_id: "1", username: "TestUser")
    @article.save
end

RSpec.describe ArticlesHelper, type: :helper do
    describe "#link_to_article" do
        it "link to article using its id" do
            create_test_article

            expect(helper.link_to_article(@article)).to include("Article 1")
            expect(helper.link_to_article(@article)).to include(article_path(@article.id))
        end
    end

    describe "#article_author_link" do
        it "link to article author using its user id" do
            create_test_article

            expect(helper.article_author_link(@article)).to include("TestUser")
            expect(helper.article_author_link(@article)).to include(profile_path(@article.user_id))
        end
    end
end