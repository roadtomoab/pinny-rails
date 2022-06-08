class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :desc, :rating
  has_one :pin
  has_one :user
end
