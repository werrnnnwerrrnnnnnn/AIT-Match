class CreatePreferences < ActiveRecord::Migration[7.2]
  def change
    create_table :preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :preferred_min_age
      t.integer :preferred_max_age

      t.timestamps
    end
  end
end
