class AddFeaturedToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :featured, :string
  end
end
