import React from 'react';

import InputSongName from '../components/InputSongName';
import InputArtistName from '../components/InputArtistName';
import InputLyrics from '../components/InputLyrics';
import InputLyricsEnglish from '../components/InputLyricsEnglish';
import AddSongOverview from '../components/AddSongOverview';

var songValues = {
  song_name: null,
  artist_name: null,
  lyrics: null,
  lyrics_english: null,
  image_url: null
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

  showStep() {
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
        return <AddSongOverview songValues={songValues}
                              saveValues={this.saveValues}
                              previousStep={this.previousStep} />
    }
  }

  render() {
    var style = {
      width : (this.state.step / 5 * 100) + '%'
    }

    return (
      <div className="container">
        <div className="row justify-content-center">
          <div className="col-6">
            <div className="add-song-card">
              <span className="progress-step">Step {this.state.step}</span>
              <div className="progress">
                <div className="progress-bar" style={style}></div>
              </div>
              <h2>Let's add a song!</h2>
              {this.showStep()}
            </div>
          </div>
        </div>
      </div>
    )
  }
}

export default SongForm
