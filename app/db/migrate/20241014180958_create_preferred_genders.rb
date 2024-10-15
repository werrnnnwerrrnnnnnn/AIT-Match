class CreatePreferredGenders < ActiveRecord::Migration[7.2]
  def change
    create_table :preferred_genders do |t|
      t.string :value
      t.string :label

      t.timestamps
    end
  end
end
