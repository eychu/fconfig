module Fconfig
  class Builder
    require 'active_support/core_ext/hash/deep_merge'

    def self.build(env, block)
      b = new(env, block)
      b.config
    end

    def initialize(env, block)
      @env = env
      @envs = {}
      @parents = {}
      instance_eval &block
    end

    def env(env, parent = nil, &block)
      @parents[env] = parent[:parent] unless parent.nil?
      @envs[env] = Proxy.build block
    end

    def config
      #p @envs
      Config.new merged_envs @env
    end

    def merged_envs(cur_env)
      parent = @parents[cur_env]
      if parent
        merged_envs(parent)
        @envs[cur_env] = @envs[parent].deep_merge(@envs[cur_env])
      end
      @envs[cur_env]
    end

  end
end