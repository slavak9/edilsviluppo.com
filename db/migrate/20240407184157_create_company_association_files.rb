class CreateCompanyAssociationFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :company_association_files do |t|
      t.string :description

      t.timestamps
    end
  end
end
