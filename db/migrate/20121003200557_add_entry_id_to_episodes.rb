class AddEntryIdToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :entry_id, :string
    add_index :episodes, :entry_id, :unique => true
  end
end
