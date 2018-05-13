class Topic < ApplicationRecord
    has_many :links, dependent: :destroy
    validates_presence_of :name
    validates_uniqueness_of :name
end
