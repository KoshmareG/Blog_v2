require "rails_helper"

RSpec.describe User, type: :model do
    describe "associations" do
        it { should have_one(:article) }
        it { should have_one_attached(:avatar) }
        it { should have_many(:likes) }
    end

    describe "#set_default_role" do
        it "it return user role: user" do
            user = create(:user)
            
            expect(user.role).to eq "user"
        end
    end
end