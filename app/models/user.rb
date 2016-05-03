class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :first_name, :last_name
  devise :database_authenticatable, :registerable,
          :trackable, :validatable

  require 'carrierwave/orm/activerecord'

  mount_uploader :avatar, AvatarUploader

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email,
     :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name,
     :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
 end

#  validates_presence_of   :avatar
#  validates_integrity_of  :avatar
#  validates_processing_of :avatar

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
