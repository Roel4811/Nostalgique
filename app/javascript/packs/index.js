import React from 'react';
import { render } from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import SongCards from '../components/SongCards';
import SongForm from '../components/SongForm';
import TestComponent from '../components/TestComponent';
import AddSongConfirmation from '../components/AddSongConfirmation';
// import NotFound from '../components/NotFound';

document.addEventListener("DOMContentLoaded", () => {

  const jsContent = document.getElementById('js-content');
  render(<BrowserRouter>
          <Switch>
            <Route exact path="/" component={SongCards} />
            <Route path="/songs/new" component={SongForm} />
            <Route path="/songs/confirm" component={AddSongConfirmation} />
          </Switch>
         </BrowserRouter>,
        jsContent)

});
