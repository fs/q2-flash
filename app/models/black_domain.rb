class BlackDomain < ActiveRecord::Base
  validates_uniqueness_of :domain_name
  validates_format_of :domain_name, :with => /^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$/
  validates_presence_of :domain_name
end
