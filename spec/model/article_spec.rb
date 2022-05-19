require "rails_helper"

RSpec.describe Article, type: :model do
    describe "validations" do
        it { should validate_presence_of :title }
        it { should validate_presence_of :text }
        it { should validate_length_of(:title).is_at_most(130) }
    end
    
    describe "associations" do
        it { should have_many :comments }
    end

    describe "#last_comment" do
        it "return the last comment" do
            article = create(:article_with_comments)
            
            expect(article.last_comment.body).to eq "comment body 3"
        end
    end
end