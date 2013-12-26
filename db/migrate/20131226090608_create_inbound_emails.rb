class CreateInboundEmails < ActiveRecord::Migration
  def change
    create_table :inbound_emails do |t|
      t.column :message_data, :json

      t.timestamps
    end
  end
end
