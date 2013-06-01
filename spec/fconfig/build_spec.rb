require 'rspec'
require 'fconfig'

describe Fconfig, "#build" do
  it "return key value" do
    c = Fconfig.build do
      env :develop do
        key 'value'
        lunljn 8
      end
    end
    p c.inspect
    'value'.should eq(c[:key]) 
  end
end