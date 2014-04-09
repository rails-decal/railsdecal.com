class CreateStudentApplications < ActiveRecord::Migration
  def change
    create_table :student_applications do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :year
      t.string :major
      t.string :gpa
      t.text :why_join
      t.text :cs_classes_taken
      t.text :current_courseload
      t.text :other_commitments
      t.text :how_did_you_hear_about_us
      t.text :how_many_hours_willing

      t.timestamps
    end
  end
end
