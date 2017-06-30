class Category < ApplicationRecord
  has_many :open_datsets
  has_many :mashup_types
end
