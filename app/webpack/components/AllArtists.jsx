import React from 'react';

class AllArtists extends React.Component {
  constructor() {
    super();
    this.renderArtists = this.renderArtists.bind(this);
  }
  renderArtists(key) {
    const artist = this.props.artists[key]
    return (
      <div key={key}>
        <a>{artist.name}</a>
      </div>
    )
  }
  render() {
    return (
      <div>
        <h2>Artists</h2>
        {Object.keys(this.props.artists).map(this.renderArtists)}
      </div>
    )
  }
}

export default AllArtists
