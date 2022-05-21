def sign_up
    Capybara.current_driver = :selenium
    visit(new_user_registration_path)

    fill_in :user_username, :with => 'UserName'
    fill_in :user_email, :with => 'user@example.ru'
    fill_in :user_password, :with => 'Password1234'
    fill_in :user_password_confirmation, :with => 'Password1234'

    click_button('Регистрация')
end
