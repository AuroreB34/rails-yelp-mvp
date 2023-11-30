class AddReferencesToReview < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :restaurant
    remove_column :reviews, :references
    add_reference :reviews, :restaurant
  end
end
