class AddXyzCodeToLookupCodes < ActiveRecord::Migration
  def change
    add_column :lookup_codes, :xyz_code, :string, :null => false, :default => "***"

    execute %{
      update lookup_codes set xyz_code = id where xyz_code = '***'
    }

    add_index :lookup_codes, :xyz_code, :unique => true
  end
end
