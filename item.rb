require 'securerandom'

class Item
    attr_accessor :id, :name, :reserve_price
    
    def initialize(name, reserve_price)
        @id = SecureRandom.uuid
        @name = name
        @reserve_price = Integer(reserve_price) rescue 'Reserve price must be a number'
    end
end