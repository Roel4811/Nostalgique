import React from 'react';
import PropTypes from "prop-types";
import { render } from 'react-dom';
import { Link } from 'react-router-dom';

class AddSongConfirmation extends React.Component {
  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="song-confirmation">
            <h1>Thank you for contributing!</h1>
            <p>The song {this.props.location.songValues.song_name} by {this.props.location.songValues.artist_name} will be reviewed and put on the website soon!</p>
            <p>Do you want to receive an email when the song is available?</p>
            <label>
              <input type="checkbox"/>
              Yes please!
            </label>
            <Link to="/" className="button-standard">Go back to homepage</Link>
          </div>
        </div>
      </div>
    )
  }
}

export default AddSongConfirmation
