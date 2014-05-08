class Pledge < ActiveRecord::Base
  attr_accessible :email, :location, :name

  @@secure_fields = [:email]

  def as_xml(options={})
    options[:except] ||= @@secure_fields
    super(options)
  end

  # Exclude password info from json output.
  def as_json(options={})
    options[:except] ||= @@secure_fields
    super(options)
  end

end
