import React from 'react';

class InputArtistName extends React.Component {
  saveAndContinue(e) {
    e.preventDefault();

    var data = {
      artist_name: this.refs.artist_name.value
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
        <label>What is the name of the Artist?</label>
        <input className="string required" type="text" ref="artist_name" defaultValue={this.props.songValues.artist_name}/>

        <button className="button-standard" onClick={(e) => this.goBack(e)}>Back</button>
        <button className="button-standard" onClick={(e) => this.saveAndContinue(e)}>Save and Continue</button>
      </div>
    )
  }
}

export default InputArtistName
