from spotipy.oauth2 import SpotifyClientCredentials
import pandas
import os
import requests
import mysql.connector as connector

con = connector.connect(user='root', password='sentify', host='127.0.0.1', database='sentify_db2')
cursor = con.cursor()

client_secret = '95c8cde70cec4665984696761d49cbca'
client_id = 'c0865b6a50f044dfa8c74feb6432b719'

credentials = SpotifyClientCredentials(client_id=client_id, client_secret=client_secret)
access_token = credentials.get_access_token()

def spotify_query(query):
    return requests.get('https://api.spotify.com/v1/search',headers={'Authorization':'Bearer '+access_token}, params={'q':query, 'type':'track', 'limit':'1'}).json()

training_directory = 'training_urls'
# csv = pandas.read_csv('full_frame.csv')
#
# for ix in range(len(csv)):
#     row = csv.ix[ix]
#     song_row = row['name']
#     artist_row = row['artist']
#     spotify_id = None
#     artist_name = None
#     result = spotify_query(str(song_row)+' artist:'+str(artist_row))
#     for track in result['tracks']['items']:
#         artists = track['artists']
#         song_name = track['name']
#         for artist in artists:
#             artist_name = artist['name']
#             artist_id = artist['id']
#             if artist_name and artist_id:
#                 break
#         spotify_id = track['id']
#         if spotify_id:
#             break
#     if spotify_id and song_name:
#         statement = """insert into Song (spotify_id, song_name, genre_id) values (%s, %s, null) on duplicate key update spotify_id=spotify_id;"""
#         payload = (spotify_id, song_name)
#         cursor.execute(statement, payload)
#         con.commit()
#     if artist_name:
#         statement = """insert into Artist (id, name) values (%s, %s) on duplicate key update id=id;"""
#         payload = (artist_id, artist_name)
#         cursor.execute(statement, payload)
#         con.commit()
#     if artist_name and song_name:
#         statement = """insert into Artist_song (artist_id, song_id) values (%s, %s) on duplicate key update artist_id=artist_id;"""
#         payload = (spotify_id,artist_id)
#         cursor.execute(statement, payload)
#         con.commit()


songs = pandas.read_sql("select * from song;", con=con)

artist = pandas.read_sql("select * from artist;", con=con)
artist_song = pandas.read_sql("select * from artist_song;", con=con)

songs.to_csv('songs_frame.csv')
artist.to_csv('artist_frame.csv')
con.close()



