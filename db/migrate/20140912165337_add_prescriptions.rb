class AddPrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.integer :patient_id
      t.string :dosage
      t.string :schedule
      t.date :starts_on
      t.date :ends_on
      t.string :user_id
      t.string :medication_id
      t.timestamps
    end
  end
end

