import React from 'react';

class InputLyricsEnglish extends React.Component {
  saveAndContinue(e) {
    e.preventDefault();

    var data = {
      song_lyrics_en: this.refs.lyrics_en.value
    }

    this.props.saveValues(data);
    this.props.nextStep();
  }
  goBack(e) {
    e.preventDefault();

    this.props.previousStep();
  }
  render() {
    return (
      <div className="add-song-card">
        <h2>Let's add a song!</h2>
        <label>What is the English translation of the lyrics?</label>
        <input className="string required" type="text" ref="lyrics_en" defaultValue={this.props.songValues.lyrics_english}/>

        <button className="button-standard" onClick={(e) => this.goBack(e)}>Back</button>
        <button className="button-standard" onClick={(e) => this.saveAndContinue(e)}>Save and Continue</button>
      </div>
    )
  }
}

export default InputLyricsEnglish
