class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :user_name
      t.integer :age
      t.references :mbti, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true
      t.references :degree, null: false, foreign_key: true
      t.references :school, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true
      t.text :educational_background
      t.text :profile_picture_url
      t.integer :preferred_min_age
      t.integer :preferred_max_age

      t.timestamps
    end
  end
end
