class Dinamica < ApplicationRecord
  has_many :reviews, inverse_of: :dinamica, dependent: :destroy
  accepts_nested_attributes_for :reviews, allow_destroy: true, reject_if: :review_invalida?

  def nota_media
    reviews.average(:nota)&.round(2)
  end

  private
  def review_invalida?(attributes)
    attributes['comentario'].blank? && attributes['nota'].blank?
  end
end
