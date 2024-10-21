class CreateMatches < ActiveRecord::Migration[7.2]
  def change
    create_table :matches do |t|
      t.references :requestor, null: false, foreign_key: { to_table: :profiles }
      t.references :receiver, null: false, foreign_key: { to_table: :profiles }
      t.string :status, default: 'pending' # Status: pending, accepted, declined

      t.timestamps
    end

    # Ensure a profile cannot request the same match more than once
    add_index :matches, [:requestor_id, :receiver_id], unique: true
  end
end