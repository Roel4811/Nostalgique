class ContactSubmissionMailer < ApplicationMailer
  default from: "noreply@nostalgique.com",
          to: "roel4811@hotmail.com"

  def send_contact_submission(contact_submission_id)
    @contact_submission = ContactSubmission.find(contact_submission_id)

    mail reply_to:      @contact_submission.email,
         subject:       'contact',
         template_name: 'send_contact_submission'
  end

end
