import React from 'react';

class AllSongs extends React.Component {
  constructor() {
    super();
    this.renderSongs = this.renderSongs.bind(this);
  }
  renderSongs(key) {
    const song = this.props.songs[key]
    return (
      <div key={key}>
        <h3>{song.name}</h3>
        <p>{song.lyrics}</p>
      </div>
    )
  }

  render() {
    return (
      <div>
        <h2>Songs</h2>
        {Object.keys(this.props.songs).map(this.renderSongs)}
      </div>
    )
  }
}

export default AllSongs
