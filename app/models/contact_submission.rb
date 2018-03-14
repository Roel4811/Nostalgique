class ContactSubmission < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :body, presence: true

  after_create :send_contact_submission

  def send_contact_submission
    ContactSubmissionMailer.send_contact_submission(self.id).deliver_later
  end
end
