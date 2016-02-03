class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    # validates :name,
    # presence: { message: "ユーザーネームを入力して下さい。"},
    # length: {minimum: 8, too_short: "ユーザーネームは８文字以上で入力してください。"},
    # uniqueness: { message: "既にそのユーザーネームは使われています。"}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email,
    presence: { message: "正しいメールアドレスの形式で入力してください。"},
    format: { with: VALID_EMAIL_REGEX,:message => '正しいメールアドレスの形式で入力してください。' },
    uniqueness: { message: "既にそのメールアドレスは登録されています。"}

    validates :password,
    presence: { message: "パスワードを入力して下さい。"},
    length: {minimum: 8, too_short: "パスワードは８文字以上で入力してください。"}

    validates :password_confirmation, presence: { message: "パスワード（確認）を入力してください"}


end

