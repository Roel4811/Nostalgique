import React from 'react';

class InputSongName extends React.Component {
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
      song_name: this.refs.song_name.value
    }

    this.props.saveValues(data);
    this.props.nextStep();
  }

  render() {
    return (
      <div>
        <label>What is the name of the song?</label>
        <input className="string required" type="text" ref="song_name" onChange={(e) => this.onChange(e)} defaultValue={this.props.songValues.song_name}/>
        <button className="button-standard right" disabled={!this.state.value} onClick={() => this.saveAndContinue()}>Save and Continue</button>
      </div>
    )
  }
}

export default InputSongName
