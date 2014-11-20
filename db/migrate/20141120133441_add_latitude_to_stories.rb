class AddLatitudeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :latitude, :float
  end
end
