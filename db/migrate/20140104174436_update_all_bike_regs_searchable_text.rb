class UpdateAllBikeRegsSearchableText < ActiveRecord::Migration
  def up
    BikeReg.all.each {|x| x.save}
  end

  def down
    # have a nice day
  end
end
