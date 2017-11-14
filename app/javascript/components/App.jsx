import React from 'react';
import Header from './Header';
import AllSongs from './AllSongs';
import AddSongForm from './AddSongForm';

class App extends React.Component {
  constructor() {
    super();

    //bind methods to this components
    this.addSong = this.addSong.bind(this);

    this.state = {
      songs: {}
    }
  }

  componentWillMount() {
    // Add songs to state
    const node = document.getElementById('songs_data');
    const songs = JSON.parse(node.getAttribute('data'));
    this.setState({
      songs: songs
    });
  }

  addSong(song) {
    console.log('song');
    //copy state
    const songs = {...this.state.songs}
    // ad new song
    const timestamp = Date.now();
    songs[`song-${timestamp}`] = song
    // set state with copy
    this.setState({ songs: songs })
  }

  render() {
    return (
      <div>
        <Header />
        <AllSongs songs={this.state.songs} />
        <AddSongForm addSong={this.addSong} />
      </div>
    )
  }
};

export default App
