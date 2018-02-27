import React from 'react';
import { render } from 'react-dom';
import { Router, Route, IndexRoute, hashHistory } from 'react-router';

import SongCards from '../components/SongCards';
import SongForm from '../components/SongForm';
import TestComponent from '../components/TestComponent';
// import NotFound from '../components/NotFound';

document.addEventListener("DOMContentLoaded", () => {
  const app = document.getElementById('app');
  render(<Router history={hashHistory}>
           <Route path="/" component={SongCards}>
             <IndexRoute component={Songs} />
             <Route path="artists" component={Artists} />
             <IndexRoute path="add song" component={Songs} />
           </Route>
         </Router>, app
  )
  // const songs_node = document.getElementById('songs_data');
  // const new_song_node = document.getElementById('user_data');
  // if (songs_node) {
  //  const data = JSON.parse(songs_node.getAttribute('data'));
  //  render(<SongCards songs={data} />, document.querySelector('#song_cards'));
  // }
  // if (new_song_node) {
  //  const data = JSON.parse(new_song_node.getAttribute('data'));
  //  render(<SongForm user={data} />, document.querySelector('#add_song_card'));
  // }
});
