class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   scope :all_except, ->(user) { where.not(id: user) }
   after_create_commit { broadcast_append_to "users" }
   has_many :messages 
   has_one_attached :avatar

   after_commit :add_default_avatar, on: %i[create update]

   private

   def add_default_avatar
    return if avatar.attached?
      
      avatar.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_avatar.avif'
          )
        ), filename: 'default_avatar.avif',
        content_type: 'image/avif'
      )
   end
end
