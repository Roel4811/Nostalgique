import React from 'react';

class InputArtistName extends React.Component {
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
        <input className="string required" type="text" ref="artist_name" onChange={(e) => this.onChange(e)} defaultValue={this.props.songValues.artist_name}/>
        <div className="navigation-buttons">
          <button className="button-standard" onClick={() => this.goBack()}>Back</button>
          <button className="button-standard right" disabled={!this.state.value} onClick={() => this.saveAndContinue()}>Save and Continue</button>
        </div>
      </div>
    )
  }
}

export default InputArtistName
