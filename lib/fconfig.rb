require 'fconfig/version'

module Fconfig
  autoload :Builder, 'fconfig/builder'
  autoload :Proxy,   'fconfig/proxy'
  autoload :Config,  'fconfig/config'

  def self.build(env, &block)
     data = Builder.build env, block
  end
end

