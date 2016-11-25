class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:validatable, :authentication_keys => [:login]
  attr_accessor :login

  #validates :username, :presence => true, :uniqueness => { :case_sensitive => false } 
  #validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


  #  def login=(login)
  #   @login = login
  #  end

  # def login
  #   @login || self.username || self.email
  # end

  def self.find_first_by_auth_conditions(warden_conditions)
  conditions = warden_conditions.dup
  if login = conditions.delete(:login)
    where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
  else
    where(conditions).first
  end
  end

validates :username, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { with: /\A[a-zA-Z0-9]*\z/, message: "may only contain letters and numbers." }


#     validate :validate_username

# def validate_username
#   if User.where(email: username).exists?
#     errors.add(:username, :invalid)
#   end
# end
end
