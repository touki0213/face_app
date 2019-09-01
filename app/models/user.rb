class User < ApplicationRecord 
    before_save {self.email = email.downcase} #大文字も小文字も同じものとする
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i #正規表示
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: {case_sensitive: false}
    has_secure_password #「password_digest」「bcrypt」で使える魔術的なメソッド
    validates :password, presence: true, length:{minimum:6}
  end
  