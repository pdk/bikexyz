class LookupCode < ActiveRecord::Base
  # This only real purpose of this model is to generate id values.
  # We're using a table to simulate a sequence generator.
  # Basically, we can delete all the but last row in this table
  # whenever we want.

  def LookupCode.n_to_obscode(n)
    n.to_s(21).tr("0123456789abcdefghijk", "a8c0fh1j7xmnp5vw23469").upcase.reverse
  end
    
  def LookupCode.obscode_to_n(c)
    # Once we've generated the code, we probably don't
    # care what the integer value was anymore.
    c.downcase.tr("a8c0fh1j7xmnp5vw23469", "0123456789abcdefghijk").reverse.to_i(21)
  end
  
  def LookupCode.disambiguate(c)
    c.downcase.tr("0123456789abcdefghijklmnopqrstuvwxyz", "0123456789a8c0ffch1jx1mn0p0p57vvwxv2").upcase
  end

  def compute_lookup_code
    # irb(main):050:0> 21.to_s(21)
    # => "10"
    # irb(main):051:0> 22.to_s(21)
    # => "11"
    # irb(main):052:0> 0.to_s(21)
    # => "0"
    # irb(main):053:0> 10.to_s(21)
    # => "a"
    # irb(main):054:0> 100.to_s(21)
    # => "4g"
    # irb(main):055:0> 1000.to_s(21)
    # => "25d"
    # irb(main):056:0> 1_000_000.to_s(21)
    # => "52kc1"
    # irb(main):057:0> 1_000_000_000.to_s(21)
    # => "bdhieed"

    LookupCode.n_to_obscode(self.id)
  end
  
  def to_s
    self.compute_lookup_code
  end

  def val
    self.compute_lookup_code
  end
end
