import React from 'react';
import PropTypes from "prop-types";
import { withRouter } from "react-router-dom";

class AddSongOverview extends React.Component {
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
      success: (result) => {
        const location = {
          pathname: 'confirm',
          songValues: this.props.songValues,
          song_id: result
        }
        this.props.history.push(location);
      },
      error: function(response) {
        console.log("fail");
      }
    });
  }
  goBack() {
    this.props.previousStep();
  }
  render() {
    return (
      <div className="song-overview">
        <div className="row">
          <div className="col">
            <p>{this.props.songValues.song_name} - {this.props.songValues.artist_name}</p>
          </div>
        </div>
        <div className="row">
          <div className="col-6">
            <p>{this.props.songValues.lyrics}</p>
          </div>
          <div className="col-6">
            <p>{this.props.songValues.lyrics_english}</p>
          </div>
        </div>
        <div className="navigation-buttons">
          <button className="button-standard" onClick={() => this.goBack()}>Back</button>
          <button className="button-standard right" onClick={() => this.submitSong()}>Save song</button>
        </div>
      </div>
    )
  }
}

export default withRouter(AddSongOverview)
