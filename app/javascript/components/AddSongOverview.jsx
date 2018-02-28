import React from 'react';
import PropTypes from "prop-types";

class AddSongOverview extends React.Component {
  static contextTypes = {
    router: PropTypes.object
  }
  constructor(props, context) {
    super(props, context);
  }
  submitSong() {
    $.ajax({
      url: '/songs.json',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { song: {
        name: this.props.songValues.song_name,
        artist_name: this.props.songValues.artist_name,
        lyrics: this.props.songValues.lyrics,
        lyrics_english: this.props.songValues.lyrics_english
      } },
      success: (response) => {
        console.log(this.context);
        this.context.router.history.push("confirm");
      },
      error: function(response) {
        console.log("fail");
        // this.setState({ errors: response.errors })
      }
    });
  }
  goBack() {
    this.props.previousStep();
  }
  render() {
    return (
      <div>
        <h3>Check your song</h3>
        <p>{this.props.songValues.song_name}</p>
        <p>{this.props.songValues.artist_name}</p>
        <p>{this.props.songValues.lyrics}</p>
        <p>{this.props.songValues.lyrics_english}</p>
        <button className="button-standard" onClick={() => this.goBack()}>Back</button>
        <button className="button-standard" onClick={() => this.submitSong()}>Save song</button>
      </div>
    )
  }
}

export default AddSongOverview
