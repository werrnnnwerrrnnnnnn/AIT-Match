class CreateProfilePreferredRelationships < ActiveRecord::Migration[7.2]
  def change
    create_table :profile_preferred_relationships do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :preferred_relationship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
