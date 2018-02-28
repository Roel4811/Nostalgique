class ContactSubmissionsController < ApplicationController

  def create
    contact_submission = ContactSubmission.new(contact_submission_params)

    if contact_submission.save
      return
    else
      render '/contact'
    end
  end

  private

  def contact_submission_params
    params.
      require(:contact_submission).
        permit(:name, :email, :body)
  end

end
