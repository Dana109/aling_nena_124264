class Item < ActiveRecord::Base
end

def random
  Item.order("random()").first(5)
end