import React from 'react';
import Header from './Header';
import AllSongs from './AllSongs';
import AllArtists from './AllArtists';
import AddSongForm from './AddSongForm';
import $ from 'jquery';

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
    const songs_node = document.getElementById('songs_data');
    const songs = JSON.parse(songs_node.getAttribute('data'));
    const artists_node = document.getElementById('artists_data');
    const artists = JSON.parse(artists_node.getAttribute('data'));

    this.setState({
      songs: songs,
      artists: artists
    });
  }

  addSong(song) {
    console.log({song})
    $.ajax({
      url: '/songs.json',
      type: 'POST',
      beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      data: { song: {
        name: song.name,
        artist_id: 1,
        lyrics: song.lyrics
      } },
      success: (response) => {
        //copy state
        const songs = {...this.state.songs}
        // add new song
        const timestamp = Date.now();
        songs[`song-${timestamp}`] = response
        // set state with copy
        this.setState({ songs: songs })
      },
      error: function(response) {
        console.log("fail");
        // this.setState({ errors: response.errors })
      }
    });

  }

  render() {
    return (
      <div>
        <Header />
        <AllArtists artists={this.state.artists} />
        <AllSongs songs={this.state.songs} />
        <AddSongForm addSong={this.addSong} />
      </div>
    )
  }
};

export default App
