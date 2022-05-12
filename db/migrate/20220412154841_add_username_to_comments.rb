class AddUsernameToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, index: true
    add_column :comments, :avatar, :string
  end
end
