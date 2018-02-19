import React from 'react';

class InputSongName extends React.Component {
  saveAndContinue() {
    e.preventDefault();

    var data = {
      song_name: this.refs.name.getDOMNode().value
    }

    this.props.saveValues(data);
    this.props.nextStep();
  }

  render() {
    <div>
      <label>What is the name of the song?</label>
      <input type="text" ref="song_name" defaultvalue={this.props.songValues.name}/>

      <button onClick={ this.saveAndContinue }>Save and Continue</button>
    </div>
  }
}

export default InputSongName
