module Fconfig
  class Builder
    def self.build(env, block)
      b = new(env, block)
      b.config
    end

    def initialize(env, block)
      @env = env
      @envs = {}
      instance_eval &block
    end

    def env(env, &block)
      @envs[env] = Proxy.build block
    end

    def config
      Config.new @envs[@env]
    end
  end
end