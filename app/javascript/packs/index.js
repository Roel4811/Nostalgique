import React from 'react';
import { render } from 'react-dom';

import SongCards from '../components/SongCards'
// import NotFound from '../components/NotFound';

document.addEventListener('turbolinks:render', () => {
 const songs_node = document.getElementById('songs_data');
 const new_song_node = document.getElementById('user_data');
 if (songs_node) {
   const data = JSON.parse(songs_node.getAttribute('data'));
   render(<SongCards songs={data} />, document.querySelector('#song_cards'));
 }
 if (new_song_node) {
   const data = JSON.parse(new_song_node.getAttribute('data'));
   render(<AddSong user_id={data} />, document.querySelector('#user_id'));
 }
});
