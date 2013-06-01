module Fconfig
  class Config
    def initialize(hash)
      hash.each_pair do |key, value|
        return_val = value
        if value.is_a? Hash
          return_val = Config.new value
        end

        define_singleton_method key.to_sym do
          return_val
        end
      end
    end
  end
end