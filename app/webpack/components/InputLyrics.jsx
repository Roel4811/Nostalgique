import React from 'react';

class InputLyrics extends React.Component {
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
        <textarea className="string required" type="text" cols="80" rows="20" ref="lyrics" onChange={(e) => this.onChange(e)} defaultValue={this.props.songValues.lyrics}>
        </textarea>

        <div className="navigation-buttons">
          <button className="button-standard" onClick={() => this.goBack()}>Back</button>
          <button className="button-standard right" disabled={!this.state.value} onClick={() => this.saveAndContinue()}>Save and Continue</button>
        </div>
      </div>
    )
  }
}

export default InputLyrics
