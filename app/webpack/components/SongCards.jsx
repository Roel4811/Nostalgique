import React from 'react';
import SongCard from '../components/SongCard';

class SongCards extends React.Component {
  state = {
    loading: false,
    songs: []
  }
  componentDidMount() {
    this.setState({
      loading: true
    })
    fetch('/api/v1/songs.json')
      .then(res => res.json())
      .then(songs => {
        this.setState({
          songs,
          loading: false
        })
      })
  }

  render() {
    const {loading, songs} = this.state
    return (
      <section className="song-cards">
        <div className="container">
          <div className="flex-container">
            {
              loading ? (
                <h1>Loading...</h1>
              ) : (
                songs.map(song => <SongCard song={song} key={song.id} />)
              )
            }
          </div>
        </div>
      </section>
    )
  }
}

export default SongCards
