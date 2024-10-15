class CreateDegrees < ActiveRecord::Migration[7.2]
  def change
    create_table :degrees do |t|
      t.string :value
      t.string :label

      t.timestamps
    end
  end
end
