class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.text :questions
      t.text :answers
      t.text :categories
      t.string :difficulty

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
