import React from 'react';

class AddSongCard extends React.Component {
  constructor() {
    super();
    this.state = {
      input_song_name: '',
      input_artist_name: '',
      input_lyrics: '',
      input_lyrics_english: ''
    }
  }
  render() {
    return (
      <div className="add-song-card">
        <h2>Let's add a song!</h2>
        <SongForm input_song_name={this.state.input_song_name}
                  input_artist_name{this.state.input_artist_name}
                  input_lyrics={this.state.input_lyrics}
                  input_lyrics_english={this.state.input_lyrics_english}/>
      </div>
    )
  }
}

export default AddSongCard
