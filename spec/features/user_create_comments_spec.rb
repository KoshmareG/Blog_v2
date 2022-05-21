require "rails_helper"

RSpec.feature "Comments Creation", type: :feature do
    before(:each) do
        sign_up
    end

    scenario "allows user to create comment" do
        create_article

        fill_in :comment_body, :with => 'newComment'
        click_button('Отправить')

        expect(page).to have_content('newComment')
        expect(page).to have_content('Ответить')
    end

end