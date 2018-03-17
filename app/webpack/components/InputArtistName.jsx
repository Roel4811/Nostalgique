import React from 'react';

class InputArtistName extends React.Component {
  saveAndContinue() {
    var data = {
      artist_name: this.refs.artist_name.value
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
        <label>What is the name of the Artist?</label>
        <input className="string required" type="text" ref="artist_name" defaultValue={this.props.songValues.artist_name}/>

        <button className="button-standard" onClick={() => this.goBack()}>Back</button>
        <button className="button-standard" onClick={() => this.saveAndContinue()}>Save and Continue</button>
      </div>
    )
  }
}

export default InputArtistName
