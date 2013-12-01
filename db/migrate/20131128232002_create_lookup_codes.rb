class CreateLookupCodes < ActiveRecord::Migration
  def change
    create_table :lookup_codes do |t|
      t.timestamps
    end
    
    execute %{
      ALTER SEQUENCE lookup_codes_id_seq increment by 1 restart with 12345
    }
  end
end
