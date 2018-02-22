import React from 'react';

class InputLyrics extends React.Component {
  saveAndContinue(e) {
    e.preventDefault();

    var data = {
      lyrics: this.refs.lyrics.value
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
        <label>What are the lyrics of the Song (in French)?</label>
        <input className="string required" type="text" ref="lyrics" defaultValue={this.props.songValues.lyrics}/>

        <button className="button-standard" onClick={(e) => this.goBack(e)}>Back</button>
        <button className="button-standard" onClick={(e) => this.saveAndContinue(e)}>Save and Continue</button>
      </div>
    )
  }
}

export default InputLyrics
