class User < ApplicationRecord

  has_many :drops, dependent: :destroy

  enum status: { Ativo: true, Inativo: false }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
