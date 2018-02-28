import React from 'react';
import { render } from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import SongCards from '../components/SongCards';
import SongForm from '../components/SongForm';
import TestComponent from '../components/TestComponent';
import AddSongConfirmation from '../components/AddSongConfirmation';
import ContactForm from '../components/ContactForm';
import ThankYou from '../components/ThankYou';
// import NotFound from '../components/NotFound';

const jsContent = document.getElementById('js-content');
render(<BrowserRouter>
        <Switch>
          <Route exact path="/" component={SongCards} />
          <Route exact path="/songs" component={SongCards} />
          <Route path="/songs/new" component={SongForm} />
          <Route path="/songs/confirm" component={AddSongConfirmation} />
          <Route path="/contact" component={ContactForm} />
          <Route path="/thank-you" component={ThankYou} />
        </Switch>
       </BrowserRouter>,
      jsContent)
