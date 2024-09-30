class AddApplicantIdToCv < ActiveRecord::Migration[7.1]
  def change
    add_column :cvs, :applicant_id, :integer
    add_column :cvs, :content, :text
  end
end
