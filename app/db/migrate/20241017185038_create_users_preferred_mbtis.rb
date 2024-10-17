class CreateUsersPreferredMbtis < ActiveRecord::Migration[7.2]
  def change
    create_table :users_preferred_mbtis do |t|
      t.references :preference, null: false, foreign_key: true
      t.references :preferred_mbti, null: false, foreign_key: true

      t.timestamps
    end
  end
end
