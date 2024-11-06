class RemoveProfilePictureUrlFromProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :profiles, :profile_picture_url, :text
  end
end