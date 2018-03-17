import React from 'react';

const SongCard = ({song}) => {
  return (
    <a className="song-card-link" href={'/songs/' + song.id}>
      <div className="song-card">
        <div className="song-text">
          <h3>{song.name}</h3>
          <p>{song.lyrics.substring(0, 100)}</p>
        </div>
        <div className="song-image">
          <img src={song.image_url} alt="song-image"/>
        </div>
      </div>
    </a>
  )
}

export default SongCard
