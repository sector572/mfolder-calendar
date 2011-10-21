require 'spec_helper.rb'

describe 'Test1' do
  it "should return version" do
  	Test1.new
  	Test1.new.version.should == "1.1.1"
  end
end
