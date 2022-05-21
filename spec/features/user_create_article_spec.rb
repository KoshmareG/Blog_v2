require "rails_helper"

RSpec.feature "Article Creation", type: :feature do
    before(:each) do
        sign_up
    end

    scenario "allows user to visit new article page" do
        visit(new_article_path)

        expect(page).to have_content('Новая статья')
    end
end