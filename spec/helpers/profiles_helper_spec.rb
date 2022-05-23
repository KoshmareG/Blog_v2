require "rails_helper"

def create_test_user userRole
    @user = User.new(id: "1", email: "testuser@example.ru", username: "TestUser", role: "#{userRole}")
    @user.save
end

RSpec.describe ProfilesHelper, type: :helper do
    describe "#user_role" do
        it "show user role user on russian" do
            create_test_user role = "user"

            expect(helper.user_role(@user)).to include("Пользователь")
        end

        it "show user role moderator on russian" do
            create_test_user role = "moderator"

            expect(helper.user_role(@user)).to include("Модератор")
        end

        it "show user role administrator on russian" do
            create_test_user role = "admin"

            expect(helper.user_role(@user)).to include("Администратор")
        end
    end
end