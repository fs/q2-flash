require 'spec_helper'

describe BlackDomain do
  before :all do
    BlackDomain.delete_all
  end

  it "should validate format of domain name" do
    domain = BlackDomain.new(:domain_name => "")
    domain.valid?.should == false

    domain.domain_name = "google"
    domain.valid?.should == false

    domain.domain_name = "google.com1"
    domain.valid?.should == false

    domain.domain_name = "google.com"
    domain.valid?.should == true
  end

  it "should validate uniquality of domain name" do
    domain = BlackDomain.create(:domain_name => "google.com")
    domain.valid?.should == true

    domain2 = BlackDomain.new(:domain_name => "google.com")
    domain2.valid?.should == false
  end
end
