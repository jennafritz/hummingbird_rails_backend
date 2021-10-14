class SongsController < ApplicationController

    before_action :find_song, only: [:show, :update, :destroy]

    # def index
    #     chosen_songs = []
    #     decades = params.keys.select do |param|
    #         param.to_i > 1949
    #     end

    #     decades.map do |decade|
    #         decade_selected = decade.to_i
    #         decade_end = decade_selected + 9
    #         songs_selected_by_decade = Song.where("year BETWEEN ? AND ?", decade_selected, decade_end)
    #         songs_selected_by_decade.map do |song_instance|
    #             chosen_songs << song_instance
    #         end
    #     end

    #     num_songs = params["numSongs"].to_i
    #     random_songs = chosen_songs.sample(num_songs)
    #     render json: random_songs, status: :ok
    # end

    def get_songs
        chosen_songs = []
        # byebug
        decades = params["decades"]
        # (numTurns - 1) % 4
        start = params["numGroups"]
        count = 0
        while count < 4
            index = (start - 1) % decades.length
            decade_selected = decades[index]
            decade_end = decade_selected + 9
            fetched_song = Song.where("year BETWEEN ? AND ?", decade_selected, decade_end).sample
            chosen_songs << fetched_song
            start += 1
            count += 1
        end
        render json: chosen_songs, status: :ok
    end



end
