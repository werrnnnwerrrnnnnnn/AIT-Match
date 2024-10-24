class CreateConversations < ActiveRecord::Migration[7.2]
  def change
    create_table :conversations do |t|
      t.references :sender, null: false, foreign_key: { to_table: :profiles } # FK to profiles table
      t.references :receiver, null: false, foreign_key: { to_table: :profiles } # FK to profiles table
      t.references :match, foreign_key: true, null: true  # Optional FK to matches table

      t.timestamps
    end
  end
end