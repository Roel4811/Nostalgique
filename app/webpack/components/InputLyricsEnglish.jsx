import React from 'react';

class InputLyricsEnglish extends React.Component {
  constructor (props) {
    super(props);
    this.state = {
      value: ''
    }
  }

  onChange(e) {
    this.setState({
      value: e.target.value
    })
  }

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
        <textarea className="string required" type="text" cols="80" rows="20" ref="lyrics_en" onChange={(e) => this.onChange(e)} defaultValue={this.props.songValues.lyrics_english}>
        </textarea>
        <div className="navigation-buttons">
          <button className="button-standard" onClick={() => this.goBack()}>Back</button>
          <button className="button-standard right" disabled={!this.state.value} onClick={() => this.saveAndContinue()}>Save and Continue</button>
        </div>
      </div>
    )
  }
}

export default InputLyricsEnglish
