import React from 'react';
import SongCard from '../components/SongCard';

const SongCards = ({songs}) => {
  return (
    <section className="song-cards">
      <div className="container">
        <div className="flex-container">
          {songs.map((song) => {
            return (
              <SongCard song={song} key={song.id} />
            )
          })}
        </div>
      </div>
    </section>
  )
}

export default SongCards
