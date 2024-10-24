class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.references :conversation, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: { to_table: :profiles }
      t.text :body

      t.timestamps
    end
  end
end