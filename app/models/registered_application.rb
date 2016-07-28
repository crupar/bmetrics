class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
 has_many :events, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates_format_of :url, :with => URI::regexp(%w(http https))

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (user) { where(user: user) }

end
