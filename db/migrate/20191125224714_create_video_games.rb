class CreateVideoGames < ActiveRecord::Migration
  def change
    create_table :video_games do |t|
      t.string :title
      t.string :publisher
      t.string :genre
    end
  end
end
