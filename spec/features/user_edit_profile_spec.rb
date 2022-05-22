require "rails_helper"

RSpec.feature "Edit Account", type: :feature do
    before(:each) do
        sign_up
    end

    scenario "allow user edit profile" do
        find('#userdropdown').click
        click_on('Мой профиль')

        click_button('Настройки аккаунта')

        click_button('Изменить информацию')
        select('Женский', from: "user_gender")
        fill_in :user_birthday, :with => Time.new(1995, 12, 10)
        fill_in :user_country, :with => 'Russia'
        fill_in :user_city, :with => 'Kemerovo'

        click_button('Изменить')
        click_on('Вернуться к профилю')

        expect(page).to have_content('Женский')
        expect(page).to have_content('1995-12-10')
        expect(page).to have_content('Russia')
        expect(page).to have_content('Kemerovo')
    end
end
