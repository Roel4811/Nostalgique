import React from 'react';
import { render } from 'react-dom';
import { Link } from 'react-router-dom';

class AddSongConfirmation extends React.Component {
  render() {
    return (
      <div>
        <h1>Thank you for contributing!</h1>
        <p>The song {this.props.songValues.song_name} by {this.props.songValues.artist_name} will be reviewed and put on the website soon!</p>
        <p>Do you want to receive an email when the song is available?</p>
        <label>
          <input type="checkbox"/>
          Yes please!
        </label>
        <Link to="/" className="button-standard">Go back to homepage</Link>
      </div>
    )
  }
}

export default AddSongConfirmation
