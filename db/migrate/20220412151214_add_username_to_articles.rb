class AddUsernameToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :username, :string
  end
end
