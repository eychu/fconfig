module Fconfig
  class Proxy < BasicObject

    def initialize(block)
      instance_eval &block
      hash = {}
    end

    def self.build(block)
      new block
    end

    def method_missing(meth, *args, &block)

    end
  end
end