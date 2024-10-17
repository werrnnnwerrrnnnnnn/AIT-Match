class RemoveAgeFromProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :profiles, :age, :integer
  end
end
