import React from 'react';

class AllSongs extends React.Component {
  constructor() {
    super();
    this.renderSongs = this.renderSongs.bind(this);
  }
  renderSongs(key) {
    const song = this.props.songs[key];
    const artist = this.props.artists.find(artist => artist.id === song.artist_id);
    return (
      <div className="song-card" key={key}>
        <h3>{song.name} - {artist.name}</h3>
        <p>{song.lyrics}</p>
      </div>
    )
  }

  render() {
    return (
      <div className="container">
        <h2>Songs</h2>
        {Object.keys(this.props.songs).map(this.renderSongs)}
      </div>
    )
  }
}

export default AllSongs
