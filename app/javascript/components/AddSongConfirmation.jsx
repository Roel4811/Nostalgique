import React from 'react';
import { render } from 'react-dom';

class AddSongConfirmation extends React.Component {
  addMessage() {
    render(<h1>Thank you for contributing!</h1>, document.getElementById('message'));
  }
  render() {
    return (
      <div>
        {this.addMessage()}
        <p>The song {this.props.songValues.song_name} by {this.props.songValues.artist_name} will be reviewed and put on the website soon!</p>
        <p>Do you want to receive an email when the song is available?</p>
        <label>
          <input type="checkbox"/>
          Yes please!
        </label>
        <a href="/" className="button-standard">Go back to homepage</a>
      </div>
    )
  }
}

export default AddSongConfirmation
