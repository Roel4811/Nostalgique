import React from 'react';

class AddSongForm extends React.Component {
  createSong(event) {
    event.preventDefault();
    const song = {
      name: this.name.value,
      lyrics: this.lyrics.value
    }
    this.props.addSong(song);
    this.songForm.reset();
  }

  render() {
    return (
      <form ref={(input) => this.songForm = input} onSubmit={(e) => this.createSong(e)}>
        <input name="name" ref={(input) => {this.name = input}} type="text" placeholder="Song Name" />
        <input name="lyrics" ref={(input) => {this.lyrics = input}} type="text" placeholder="Song Lyrics" />
        <button type="submit">+ Add Song</button>
      </form>
    )
  }
}

export default AddSongForm
