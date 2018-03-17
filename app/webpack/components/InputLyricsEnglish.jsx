import React from 'react';

class InputLyricsEnglish extends React.Component {
  saveAndContinue() {
    var data = {
      lyrics_english: this.refs.lyrics_en.value
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
        <label>What is the English translation of the lyrics?</label>
        <input className="string required" type="text" ref="lyrics_en" defaultValue={this.props.songValues.lyrics_english}/>

        <button className="button-standard" onClick={() => this.goBack()}>Back</button>
        <button className="button-standard" onClick={() => this.saveAndContinue()}>Save and Continue</button>
      </div>
    )
  }
}

export default InputLyricsEnglish
