class Account < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :account_roles
  has_many :roles, through: :account_roles

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: :password_required?

  attr_writer :password_required

  def password_required?
    @password_required
  end
end
