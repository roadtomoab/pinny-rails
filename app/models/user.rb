class User < ApplicationRecord
    has_secure_password

    has_many :pins
    has_many :reviews

    validates :username, presence: :true, uniqueness: :true
end
