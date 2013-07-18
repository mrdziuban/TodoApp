class Item < ActiveRecord::Base
  attr_accessible :completed, :description, :title, :project_id

  belongs_to :project

  validates :title, :description, presence: true
  validates_inclusion_of :completed, :in => [true, false]
end
