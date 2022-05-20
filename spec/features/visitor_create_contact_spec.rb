require "rails_helper"

feature "Contact Creation" do
    scenario "allows acces to contacts page" do
        visit(new_contacts_url)

        expect(page).to have_content 'Оставить отзыв'
    end

    scenario "allows a guest to create contact" do
        visit(new_contacts_url)

        fill_in :contact_name, :with => 'TestUser'
        fill_in :contact_email, :with => 'user@example.com'
        fill_in :contact_message, :with => 'TestMessage'
        click_button 'Отправить'

        expect(page).to have_content 'Спасибо'
    end
end