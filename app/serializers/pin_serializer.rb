class PinSerializer < ActiveModel::Serializer
  attributes :id, :title, :desc, :latitude, :longitude
  has_one :user
end
