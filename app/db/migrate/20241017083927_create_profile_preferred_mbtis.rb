class CreateProfilePreferredMbtis < ActiveRecord::Migration[7.2]
  def change
    create_table :profile_preferred_mbtis do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :preferred_mbti, null: false, foreign_key: true

      t.timestamps
    end
  end
end
