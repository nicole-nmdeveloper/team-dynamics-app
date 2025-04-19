class Dinamica < ApplicationRecord
  has_many :reviews, inverse_of: :dinamica, dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true

  def nota_media
    reviews.average(:nota)&.round(2)
  end
end
