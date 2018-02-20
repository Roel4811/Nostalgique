import React from 'react';

class InputSongName extends React.Component {
  saveAndContinue(e) {
    e.preventDefault();

    var data = {
      song_name: this.refs.song_name.value
    }

    this.props.saveValues(data);
    this.props.nextStep();
  }

  render() {
    return (
      <div className="add-song-card">
        <h2>Let's add a song!</h2>
        <label>What is the name of the song?</label>
        <input className="string required" type="text" ref="song_name" defaultValue={this.props.songValues.song_name}/>

        <button className="button-standard" onClick={(e) => this.saveAndContinue(e) }>Save and Continue</button>
      </div>
    )
  }
}

export default InputSongName
