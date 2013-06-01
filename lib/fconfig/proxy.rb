module Fconfig
  class Proxy < BasicObject

    def initialize(block)
      p 'adgsdgsrhstsrtu'
      hash = {}
      instance_eval &block
      hash
    end

    def self.build(block)
      new block
    end

    def self.method_missing(meth, *args, &block)
      p 'adgsdgsrhstsrtu'
      if block_given?
        hash[meth] = Proxy.build block
      else
        hash[meth] = args[0];
      end
    end
  end
end