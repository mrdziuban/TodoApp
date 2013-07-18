class Project < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :items, dependent: :destroy

  validates :title, :description, presence: true
end
