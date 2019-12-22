class Note < ApplicationRecord
  enum confidence: { check: 0, meh: 1, what?: 2 }

  belongs_to :notebook
  has_many_attached :screenshots

  validates_presence_of :title, :body
end
