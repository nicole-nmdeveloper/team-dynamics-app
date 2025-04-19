class Review < ApplicationRecord
  belongs_to :dinamica

  validates :nota, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "A nota precisa ser de 1 a 5."
  }
end
