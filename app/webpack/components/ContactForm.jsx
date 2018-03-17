import React from 'react';

class ContactForm extends React.Component {
  sendForm() {
    const contact_submission = {
      name: this.refs.user_name.value,
      email: this.refs.user_email.value,
      body: this.refs.message.value
    }

    $.ajax({
      url: '/contact_submissions.json',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { contact_submission: contact_submission },
      success: (response) => {
        this.props.history.push('thank-you');
      },
      error: function(response) {
        console.log("fail");
      }
    });
  }
  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col-xs-12 col-sm-8 col-sm-offset-2">
            <div className="contact-card">
              <h1>Write us!</h1>
              <p>We will respond as soon as possibe</p>
              <div className="form-inputs">
                <label>Name</label>
                <input className="item form-contold string required" type="text" ref="user_name" placeholder="Smitthy"/>
                <label>Email</label>
                <input className="item form-contold string required" type="text" ref="user_email" placeholder="Professor@professorson.com"/>
                <label>Message</label>
                <input className="item form-contold string required" type="text" ref="message" placeholder="Your message"/>
              </div>
              <button className="button-standard" onClick={() => this.sendForm()}>Send Message</button>
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default ContactForm
