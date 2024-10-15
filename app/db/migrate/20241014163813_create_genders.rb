class CreateGenders < ActiveRecord::Migration[7.2]
  def change
    create_table :genders do |t|
      t.string :value
      t.string :label

      t.timestamps
    end
  end
end
