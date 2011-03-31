require 'spec_helper'

describe User do
  before :all do
    User.delete_all
    BlackDomain.delete_all
  end

  it "should validate format of domain name" do
    u = User.new(:email => "mail@google.com", :password => "123456")
    u.valid?.should == true

    BlackDomain.create(:domain_name => "google.com")
    BlackDomain.create(:domain_name => "mail.ru")
    BlackDomain.create(:domain_name => "yahoo.com")

    u.valid?.should be_false

    u.email = "me@mail1.ru"
    u.valid?.should == true

    u.email = "me@1mail.ru"
    u.valid?.should == true

    u.email = "me@yahoo.com"
    u.valid?.should == false
  end
end
