class Dinamica < ApplicationRecord
  has_many :reviews, inverse_of: :dinamica
  accepts_nested_attributes_for :reviews, allow_destroy: true
end
