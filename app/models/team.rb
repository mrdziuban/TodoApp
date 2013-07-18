class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :projects

  validates :name, presence: true
end