require "http"

system "clear"
print "Please enter a song: "
song = gets.chomp
print "Please enter an artist: "
artist = gets.chomp
if song.include?(" ") || artist.include?(" ")
  song.gsub!(" ", "%20")
  artist.gsub!(" ", "%20")
end

response = HTTP.get("https://api.musixmatch.com/ws/1.1/track.search?format=json&callback=callback&q_track=#{song}&q_artist=#{artist}&apikey=9685bbeaae0497184f3efe0ddc1b4a77")

music_data = response.parse(:json)

song = music_data["message"]["body"]["track_list"][0]["track"]["track_name"]
artist = music_data["message"]["body"]["track_list"][0]["track"]["artist_name"]
album = music_data["message"]["body"]["track_list"][0]["track"]["album_name"]
puts "The song #{song} is a track from the album #{album} by #{artist}."