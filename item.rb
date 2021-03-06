require 'securerandom'

class Item
    attr_accessor :id, :name
    
    def initialize(name)
        @id = SecureRandom.uuid
        @name = name
    end
end