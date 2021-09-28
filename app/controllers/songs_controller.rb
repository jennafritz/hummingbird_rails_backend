class SongsController < ApplicationController

    before_action :find_song, only: [:show, :update, :destroy]

    def index
        chosen_songs = []
        decades = params.keys.select do |param|
            param.to_i > 1949
        end

        decades.map do |decade|
            decade_selected = decade.to_i
            decade_end = decade_selected + 9
            songs_selected_by_decade = Song.where("year BETWEEN ? AND ?", decade_selected, decade_end)
            songs_selected_by_decade.map do |song_instance|
                chosen_songs << song_instance
            end
        end

        num_songs = params["numSongs"].to_i
        random_songs = chosen_songs.sample(num_songs)
        render json: random_songs, status: :ok
    end

end
