class LookupCode < ActiveRecord::Base
  # This only real purpose of this model is to generate id values.
  # We're using a table to simulate a sequence generator.
  # Basically, we can delete all the but last row in this table
  # whenever we want.

  before_create :init_xyz_code
  def init_xyz_code
    self.xyz_code = LookupCode.generate_random
  end

  def LookupCode.release_unused_codes
    # Find codes that are in the lookup_codes table, 
    # but NOT in the bike_regs table. And that were
    # created a while ago.
    LookupCode.joins("LEFT OUTER JOIN bike_regs on bike_regs.xyz_code = lookup_codes.xyz_code").
      where("bike_regs.xyz_code is null").
      where("lookup_codes.created_at < ?", DateTime.now - 6.hours).
      select("lookup_codes.id").each do |r|
        r.destroy
      end
  end

  # 21^3 = 9_261
  # 21^4 = 194_481
  # 21^5 = 4_084_101
  # 21^6 = 85_766_121
  # 21^7 = 1_801_088_541
  # 21^8 = 37_822_859_361
  # 21^9 = 794_280_046_581

  def LookupCode.generate_random
    # four digit:
    # n = Random.rand(194_480 - 9_261) + 9_261
    # five digit:
    n = Random.rand(4_084_100 - 194_481) + 194_481
    # six digit:
    # n = Random.rand(85_766_120 - 4_084_101) + 4_084_101
    LookupCode.n_to_obscode(n)
  end

  def LookupCode.next_code(max_tries=100)    
    begin
      x = LookupCode.create!
    rescue ActiveRecord::RecordNotUnique
      if max_tries > 1
        return LookupCode.next_code(max_tries - 1)
      else
        raise
      end
    end
    return x
  end

  def LookupCode.n_to_obscode(n)
    n.to_s(21).tr("0123456789abcdefghijk", "a8cqfh1j7xmnp5vw23469").upcase
  end
    
  def LookupCode.obscode_to_n(c)
    # Once we've generated the code, we probably don't
    # care what the integer value was anymore.
    LookupCode.disambiguate(c).downcase.tr("a8cqfh1j7xmnp5vw23469", "0123456789abcdefghijk").to_i(21)
  end
  
  def LookupCode.disambiguate(c)
    c.downcase.tr("0123456789abcdefghijklmnopqrstuvwxyz", "q123456789a8cqffch1jx1mnqpqp57vvwxv2").upcase
  end
end
