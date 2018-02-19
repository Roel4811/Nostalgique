import React from 'react';

const SongCard = ({song}) => {
  return (
    <div className="song-card">
      <div className="song-text">
        <h3>{song.name}</h3>
        <p>{song.lyrics.substring(0, 100)}</p>
      </div>
      <div className="song-image">
        <img src={song.image_url} alt="song-image"/>
      </div>
    </div>
  )
}

export default SongCard
