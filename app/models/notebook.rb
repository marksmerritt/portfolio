class Notebook < ApplicationRecord
  enum status: { active: 0, archived: 1 }
  
  has_many :notes

  validates_presence_of :name, :status
  validates_uniqueness_of :name

  def toggle_status!
    active? ? archived! : active!
  end
end
