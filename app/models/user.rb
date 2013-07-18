class User < ActiveRecord::Base
  attr_accessible :name, :team_ids

  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships

  validates :name, presence: true
end
