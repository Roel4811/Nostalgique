import React from 'react';
import SongCard from '../components/SongCard';
import { Link } from 'react-router-dom';

const SongCards = () => {
  const songs_node = document.getElementById('songs_data');
  const songs = JSON.parse(songs_node.getAttribute('data'));
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
