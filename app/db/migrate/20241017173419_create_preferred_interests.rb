class CreatePreferredInterests < ActiveRecord::Migration[7.2]
  def change
    create_table :preferred_interests do |t|
      t.string :name

      t.timestamps
    end
  end
end
