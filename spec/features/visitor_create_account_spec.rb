require "rails_helper"

RSpec.feature "Account Creation", type: :feature do
    Capybara.current_driver = :selenium
    
    scenario "allows guest to create account" do
        sign_up

        find('#userdropdown').click
        expect(page).to have_content 'Мой профиль'
    end
end

def sign_up
    visit(new_user_registration_path)

    fill_in :user_username, :with => 'UserName'
    fill_in :user_email, :with => 'user@example.ru'
    fill_in :user_password, :with => 'Password1234'
    fill_in :user_password_confirmation, :with => 'Password1234'

    click_button('Регистрация')
end
