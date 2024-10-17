class CreateUsersPreferredInterests < ActiveRecord::Migration[7.2]
  def change
    create_table :users_preferred_interests do |t|
      t.references :preference, null: false, foreign_key: true
      t.references :preferred_interest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
