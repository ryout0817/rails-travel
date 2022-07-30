class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        # 各レコードとファイルを一対一で繋げる役割。  
        has_one_attached :image
        
        # 一対多の一の部分
        has_many :rooms
        has_many :tops
end
