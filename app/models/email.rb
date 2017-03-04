class Email < ApplicationRecord
  belongs_to :responsavel

  
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :email,  :format => EMAIL_REGEX , if: :check_email

  protected
  def check_email
    not self.email.blank?
  end
end
