require "rails_helper"

def create_test_comment
    @comment = Comment.new(id: "1", author: "TestUser", body: "TestComment", user_id: "1")
    @comment.save
end

RSpec.describe CommentsHelper, type: :helper do
    describe "#comment_author_link" do
        it "link to comment author using its userid" do
            create_test_comment

            expect(helper.comment_author_link(@comment)).to include("TestUser")
            expect(helper.comment_author_link(@comment)).to include(profile_path(@comment.user_id))
        end
    end
end