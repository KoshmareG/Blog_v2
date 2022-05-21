require "rails_helper"

RSpec.feature "Account Creation", type: :feature do
    scenario "allows guest to create account" do
        sign_up

        find('#userdropdown').click
        expect(page).to have_content 'Мой профиль'
    end
end
