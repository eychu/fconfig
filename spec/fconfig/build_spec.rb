require 'fconfig'

describe Fconfig, "#build" do
  it "return key value" do
    c = Fconfig.build do
      env :dev do
        {key: 'value'}
      end
    end
    assert_eq 'value', c.key 
  end
end