require "rails_helper"

RSpec.feature "Article Creation", type: :feature do
    before(:each) do
        sign_up
    end

    scenario "allows user to visit new article page" do
        visit(new_article_path)

        expect(page).to have_content('Новая статья')
    end

    scenario "allows user to create and edit new article" do
        visit(new_article_path)

        fill_in :article_title, :with => 'Test article title'
        find('trix-editor').set('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed')
        click_button('Опубликовать')

        expect(page).to have_content('Изменить')

        find('#articleDropdown').click
        click_on('Редактировать')

        expect(page).to have_content('Lorem ipsum dolor')

        click_button('Сохранить')

        expect(page).to have_content('Изменить')
    end
end