class CreateUsersPreferredGenders < ActiveRecord::Migration[7.2]
  def change
    create_table :users_preferred_genders do |t|
      t.references :preference, null: false, foreign_key: true
      t.references :preferred_gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
