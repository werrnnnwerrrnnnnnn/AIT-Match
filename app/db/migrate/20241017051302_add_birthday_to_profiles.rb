class AddBirthdayToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :birthday, :date
  end
end
