require 'fconfig/version'
require 'fconfig/builder'
require 'fconfig/proxy'

module Fconfig
  def self.build(env, &block)
    builder = Builder.new env, block
    builder.data
  end
end

