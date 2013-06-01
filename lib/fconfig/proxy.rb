module Fconfig
  class Proxy #< BasicObject

    attr_reader :hash

    def initialize(block)
      @hash = {}
      instance_eval &block
      @hash
    end

    def self.build(block)
      b = new block
      b.hash
    end

    def method_missing(meth, *args, &block)
      p '!'+args.inspect
      if block_given?
        @hash[meth] = Proxy.build block
      else
        @hash[meth] = args[0]
      end
    end
  end
end