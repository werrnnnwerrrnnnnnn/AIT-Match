class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :reporter_profile, null: false, foreign_key: { to_table: :profiles } # The profile of the reporter
      t.references :reported_profile, null: false, foreign_key: { to_table: :profiles } # The profile being reported
      t.string :reason, null: false # Reason for the report
      t.string :status, null: false, default: 'pending' # Status of the report, defaulting to 'pending'

      t.timestamps
    end
  end
end
