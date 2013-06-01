require 'rspec'
require 'fconfig'

describe Fconfig, "#build" do
  it "return key value" do
    c = Fconfig.build do
      env :dev do
        {key: 'value'}
      end
    end
    p c.inspect
    'value'.should eq(c[:key]) 
  end
end