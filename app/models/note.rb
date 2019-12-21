class Note < ApplicationRecord
  belongs_to :notebook
  has_many_attached :screenshots

  validates_presence_of :title, :body
end
