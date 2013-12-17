class AuthKey < ActiveRecord::Base
  attr_accessible :email, :key

  before_create :set_random_key
  def set_random_key
    self.key = Random.rand(1_000_000_000_000).to_s(36)
  end
end
