class CreateVocabTerms < ActiveRecord::Migration
  def self.up
    create_table :vocab_terms do |t|
      t.string :english
      t.string :korean
      t.string :romanized
      t.string :category
      t.string :audio_source

      t.timestamps
    end
  end

  def self.down
    drop_table :vocab_terms
  end
end
