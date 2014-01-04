class AddSearchIndexToBikeRegs < ActiveRecord::Migration
  def up
    execute "create index bike_regs_searchable_text on bike_regs using gin(to_tsvector('english', searchable_text))"
  end

  def down
    execute "drop index bike_regs_searchable_text"
  end
end
