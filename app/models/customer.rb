class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reservations, dependent: :destroy

  scope :search, -> (search_params) do
    return if search_params.blank?

    number_like(search_params[:number])
      .customername_like(search_params[:customername])
      .email_like(search_params[:email])
  end
  scope :number_like, -> (number) { where('number LIKE ?', "%#{number}%") if number.present? }
  scope :customername_like, -> (customername) { where('customername LIKE ?', "%#{customername}%") if customername.present? }
  scope :email_like, -> (email) { where('email LIKE ?', "%#{email}%") if email.present? }
end
