class CreateProfileRelationships < ActiveRecord::Migration[7.2]
  def change
    create_table :profile_relationships do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
