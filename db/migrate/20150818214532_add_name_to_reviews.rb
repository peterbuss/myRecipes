class AddNameToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :chef_name, :string
  end
end
