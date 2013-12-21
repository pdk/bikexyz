class AuthKey < ActiveRecord::Base
  attr_accessible :email, :key

  before_create :set_random_key
  def set_random_key
    self.key = Random.rand(1_000_000_000_000).to_s(36)
  end
  
  before_save :downcase_email
  def downcase_email
    self.email = email.downcase
  end
  
  def AuthKey.too_recent?(email)
    c = AuthKey.where(:email => email).where("created_at > ?", DateTime.now - 72.hours).count
    return (c >= 1)
  end
end
