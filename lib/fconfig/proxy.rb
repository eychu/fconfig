module Fconfig
  class Proxy < BasicObject
    def initialize(block)
      instance_eval &block
    end

    def method_missing(meth, *args)
      method_name = meth.id2name
      
    end
  end
end