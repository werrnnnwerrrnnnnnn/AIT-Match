class CreateProfilePreferredGenders < ActiveRecord::Migration[7.2]
  def change
    create_table :profile_preferred_genders do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
