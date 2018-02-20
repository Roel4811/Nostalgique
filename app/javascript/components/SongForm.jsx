import React from 'react';

import InputSongName from '../components/InputSongName';
import InputArtistName from '../components/InputArtistName';
import InputLyrics from '../components/InputLyrics';
import InputLyricsEnglish from '../components/InputLyricsEnglish';
import AddSongConfirmation from '../components/AddSongConfirmation';

var songValues = {
  song_name: null,
  artist_name: null,
  lyrics: null,
  lyrics_english: null
}

class SongForm extends React.Component {
  constructor() {
    super();

    this.saveValues = this.saveValues.bind(this);
    this.nextStep = this.nextStep.bind(this);
    this.previousStep = this.previousStep.bind(this);
    
    this.state = {
      step: 1
    }
  }

  saveValues(fields) {
    return function() {
      songValues = Object.assign({}, songValues, fields)
    }()
  }

  nextStep() {
    this.setState({
      step: this.state.step + 1
    });
  }

  previousStep() {
    this.setState({
      step: this.state.step - 1
    });
  }

  render() {
    switch (this.state.step) {
      case 1:
        return <InputSongName songValues={songValues}
                              nextStep={this.nextStep}
                              saveValues={this.saveValues} />
      case 2:
        return <InputArtistName songValues={songValues}
                              nextStep={this.nextStep}
                              saveValues={this.saveValues}
                              previousStep={this.previousStep} />
      case 3:
        return <InputLyrics songValues={songValues}
                              nextStep={this.nextStep}
                              saveValues={this.saveValues}
                              previousStep={this.previousStep} />
      case 4:
        return <InputLyricsEnglish songValues={songValues}
                              nextStep={this.nextStep}
                              saveValues={this.saveValues}
                              previousStep={this.previousStep} />
      case 5:
        return <AddSongConfirmation songValues={songValues}
                              previousStep={this.previousStep} />
    }
  }
}

export default SongForm
