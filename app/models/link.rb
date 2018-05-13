class Link < ApplicationRecord
  belongs_to :topic
  validates_presence_of :title, :url
end
