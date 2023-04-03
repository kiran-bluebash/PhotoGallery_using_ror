class RemoveColumnNameFromAlbums < ActiveRecord::Migration[7.0]
  def change
    remove_column :albums, :published, :text
  end
end
