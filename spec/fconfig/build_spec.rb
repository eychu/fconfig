require 'rspec'
require 'fconfig'

describe Fconfig, "#build" do
  it "return key value" do
    c = Fconfig.build :develop do
      env :develop do
        key 'value'
      end
    end
    #p c.inspect
    'value'.should eq(c.key)
  end

  it "return group value" do
    c = Fconfig.build :develop do
      env :develop do
        k1 'v1'
        group1 do
          k2 'v2'
        end
      end
    end
    #p c.inspect
    'v2'.should eq(c.group1.k2)
  end
end