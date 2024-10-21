class RemovePreferredAgeFromProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :profiles, :preferred_min_age, :integer
    remove_column :profiles, :preferred_max_age, :integer
  end
end