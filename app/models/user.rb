class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :role
  after_create :set_default_role
  # has_many :bus_stops
  # has_many :bus_routes
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
  
  def admin?
   !self.role.nil? && self.role.name == "Admin"
  end

  def moderator?
   !self.role.nil? && self.role.name == "Moderator"
  end
  
  def regular?
   !self.role.nil? && self.role.name == "Regular"
  end


  private

  def set_default_role
  	#self.role ||= Role.find_by_name('registered')
    self.role ||= Role.find_by name:"Regular" if self.role.nil?
  end

#     validate :validate_username

# def validate_username
#   if User.where(email: username).exists?
#     errors.add(:username, :invalid)
#   end
# end
end
