class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :confirmable,
          :lockable,
          :timeoutable,
          :trackable

  validates :nickname, presence: true
  validates :gender, presence: true

  enum gender: {
    unanswered: 0,
    male: 1,
    female: 2
  }

  class << self
    def genders_i18n
      I18n.t("enums.user.gender")
    end
  end
end
