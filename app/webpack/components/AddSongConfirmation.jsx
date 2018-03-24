import React from 'react';
import PropTypes from "prop-types";
import { render } from 'react-dom';

class AddSongConfirmation extends React.Component {
  setEmailService() {
    $.ajax({
      url: `/songs/${this.props.location.song_id}.json`,
      type: 'PATCH',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { song: {
        email_service: this.refs.checkbox.checked
      }},
      success: (response) => {
        this.props.history.push({pathname: '/'});
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
          <div className="song-confirmation">
            <h1>Thank you for contributing!</h1>
            <div className="song-confirmation-text">
              <p>The song {this.props.location.songValues.song_name} by {this.props.location.songValues.artist_name} will be reviewed and put on the website soon!</p>
              <p>Do you want to receive an email when the song is available?</p>
              <label>
                <input type="checkbox" ref="checkbox"/> Yes please!
              </label>
            </div>
            <button className="button-standard" onClick={() => this.setEmailService()}>Go back to homepage</button>
          </div>
        </div>
      </div>
    )
  }
}

export default AddSongConfirmation
