class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  validates :username, :email, presence: true, uniqueness: true
  validate :at_least_16yr_old

  private

  def at_least_16yr_old
    return errors.add(:birth_date, "Invalid birth date") if birth_date.nil?

    get_age = ->(birth_date) do
      time_since_birth = Time.now - birth_date
      (Time.new(0) + time_since_birth).year
    end

    unless get_age.call(birth_date.to_time) >= 16
      errors.add(:birth_date, "Must be at least 16 year old")
    end
  end
end
