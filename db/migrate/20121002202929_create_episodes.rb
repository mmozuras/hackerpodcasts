class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.datetime :published_at
      t.string :name
      t.text :description
      t.string :audio_url
      t.references :podcast

      t.timestamps
    end
    add_index :episodes, :podcast_id
  end
end
