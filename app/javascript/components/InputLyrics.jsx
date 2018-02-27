import React from 'react';

class InputLyrics extends React.Component {
  saveAndContinue() {
    var data = {
      lyrics: this.refs.lyrics.value
    }

    this.props.saveValues(data);
    this.props.nextStep();
  }
  goBack() {
    this.props.previousStep();
  }
  render() {
    return (
      <div>
        <label>What are the lyrics of the Song (in French)?</label>
        <input className="string required" type="text" ref="lyrics" defaultValue={this.props.songValues.lyrics}/>

        <button className="button-standard" onClick={() => this.goBack()}>Back</button>
        <button className="button-standard" onClick={() => this.saveAndContinue()}>Save and Continue</button>
      </div>
    )
  }
}

export default InputLyrics
