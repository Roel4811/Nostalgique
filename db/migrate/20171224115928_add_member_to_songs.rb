class AddMemberToSongs < ActiveRecord::Migration[5.1]
  def change
    add_reference :songs, :member, type: :integer, foreign_key: true
  end
end
