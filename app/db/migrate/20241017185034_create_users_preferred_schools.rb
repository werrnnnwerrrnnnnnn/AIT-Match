class CreateUsersPreferredSchools < ActiveRecord::Migration[7.2]
  def change
    create_table :users_preferred_schools do |t|
      t.references :preference, null: false, foreign_key: true
      t.references :preferred_school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
