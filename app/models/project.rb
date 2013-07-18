class Project < ActiveRecord::Base
  attr_accessible :title, :description, :team_id

  has_many :items, dependent: :destroy
  belongs_to :team

  validates :title, :description, presence: true
end
