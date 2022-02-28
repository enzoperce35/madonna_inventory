class User < ApplicationRecord
  has_many :inventory_updates
  has_many :items, through: :inventory_updates

  has_many :attendances
  
  validates :username, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
