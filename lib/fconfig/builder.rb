module Fconfig
  class Builder
    attr_accessor :data

    def initialize(env, block)
      @env = env
      instance_eval &block
    end

    def env(env, &block)
      data[env] = Proxy.new block
    end
  end
end