class Project < ActiveRecord::Base
  attr_accessible :title, :description

  validates :title, :description, presence: true
end
