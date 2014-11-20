class AddLongitudeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :longitude, :float
  end
end
