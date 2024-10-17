class CreatePreferredSchools < ActiveRecord::Migration[7.2]
  def change
    create_table :preferred_schools do |t|
      t.string :name
      t.string :abbreviation

      t.timestamps
    end
  end
end
