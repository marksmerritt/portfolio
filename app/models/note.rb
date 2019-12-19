class Note < ApplicationRecord
  belongs_to :notebook

  validates_presence_of :title, :body
end
