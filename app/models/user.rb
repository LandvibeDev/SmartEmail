class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable


  mount_uploader :userProfile, UserProfileUploader

  has_many :events
  has_many :contents
  has_many :userpop3s
  has_many :usermails
  has_many :invites
  has_many :pushs
  has_many :messages
  has_many :user_categories

  has_many :projects_users
  has_many :projects, :through => :projects_users

  has_many :team_events_users
  has_many :team_events, :through => :team_events_users

  has_and_belongs_to_many :groups, -> { distinct }
end
