require "fconfig/version"

module Fconfig

  def self.build &block
    instance_eval &block
  end

  def self.env env, &block
    instance_eval &block
  end
end

