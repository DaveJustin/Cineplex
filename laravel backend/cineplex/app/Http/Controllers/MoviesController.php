<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Movie;
use App\Actor;
use App\Genre;
use App\Producer;
use DB;
use Image;
use App\Film_Actor;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;


class MoviesController extends Controller
{
    public function index() 
    {
    	// return view('movies');
        return response()->json([
            'movies' => Movie::orderBy('id', 'DESC')->get()
        ],200);
    }
    public function getMovie(Request $request) 
    {
    	// $film = Movie::orderBy('id', 'DESC')->get();
    	// return json_encode($film);
        $movie = Movie::with('producer')->with('genre')->with('actor')->orderBy('id', 'DESC')->get();
    	return json_encode($movie);
    }

    public function viewFilm(Request $request)
    {
        
        $film = Movie::where('id', $request->id)->with('producer')->with('genre')->with('actor')->orderBy('id', 'DESC')->first();
        return json_encode($film);
    }
 
    public function addFilm() 
    {
        $actor = Actor::orderBy('id', 'DESC')->get();
        $genre = Genre::orderBy('id', 'DESC')->get();
        $producer = Producer::orderBy('id', 'DESC')->get();

        $data = [];
        $data[0] = $actor;
        $data[1] = $genre;
        $data[2] = $producer;
        return json_encode($data);
    }

    public function saveFilm(Request $request)
    {
        $film = new Movie;
        $film->film_title = $request->title;
        $film->prod_id = $request->producer_id;
        $film->gen_id = $request->genre_id;
        $film->summary = $request->content;
        $film->release_date = $request->date_release;
        $film->country = $request->country_release;
        $film->image = $request->image;
        $film->save();

        Log::info('Movie:', ['id'=> $film->id,'film_title'=> $film->film_title, 'prod_id'=> $film->prod_id, 'gen_id'=> $film->gen_id,'summary'=> $film->summary, 'release_date'=> $film->release_date,'country'=> $film->country,'image'=> $film->image]);
        Storage::put('public/img/movies_poster/'.$request->image,base64_decode($request->imgMovie));
        
        return response()->json([
            "message" => "Movie Added"
        ], 201);


        // $picture = $request->file('poster');
        // $image_name     = time() . '.' . $picture->getClientOriginalExtension();
        // Image::make($picture)->resize(600,898)->save( public_path('img/film_posters/' . $image_name) );

        // if($request->hasFile('poster')) {
        //     $film = new Movie;
        //     $film->film_title = $request->title;
        //     $film->prod_id = $request->producers;
        //     $film->gen_id = $request->genres;
        //     $film->summary = $request->plot;
        //     $film->release_date = $request->date_released;
        //     $film->country = $request->countryRelease;
        //     $film->image = $image_name;
        //     $film->save();

        //     $cnt = count($request->actor_id);
        //     for($i = 0; $i < $cnt; $i++) {
        //         $film_actors = [
        //                 'movie_id' => $film->id,
        //                 'actor_id' => $request->actor_id[$i]
        //         ];
        //         DB::table('film_actor')->insert($film_actors);
        //     }
        //     return json_encode(array("status"=>"OK", "movie"=>$film));
        // }
        // else {
        //     return json_encode(array("status"=>"Error", "movie"=>"Please select poster!"));
        // }
    }

    public function editFilm(Request $request) 
    {
        $actor = Actor::orderBy('id', 'DESC')->get();
        $genre = Genre::orderBy('id', 'DESC')->get();
        $producer = Producer::orderBy('id', 'DESC')->get();
        $movie = Movie::where('id', $request->id)->with('producer')->with('genre')->with('actor')->first();

        $data = [];
        $data[0] = $actor;
        $data[1] = $genre;
        $data[2] = $producer;
        $data[3] = $movie;
        return json_encode($data);
    }

    
    public function updateFilm(Request $request) 
    {
        $film = Movie::where('id', $request->id)->first();
        $film->film_title = $request->title;
        $film->prod_id = $request->producer_id;
        $film->gen_id = $request->genre_id;
        $film->summary = $request->content;
        $film->release_date = $request->date_release;
        $film->country = $request->country_release;
        $film->image = $request->image;
        $film->save();

        Log::info('Movie:', ['id'=> $film->id,'film_title'=> $film->film_title, 'prod_id'=> $film->prod_id, 'gen_id'=> $film->gen_id,'summary'=> $film->summary, 'release_date'=> $film->release_date,'country'=> $film->country,'image'=> $film->image]);
        Storage::put('public/img/movies_poster/'.$request->image,base64_decode($request->imgMovie));
        
        return response()->json([
            "message" => "Movie Updated"
        ], 201);
        // if($request->hasFile('film_posters')) {
        //     $picture = $request->file('film_posters');
        //     $image_name     = time() . '.' . $picture->getClientOriginalExtension();
        //     Image::make($picture)->resize(600,898)->save( public_path('img/film_posters/' . $image_name) );

        //     $film = Movie::where('id', $request->film_id)->first();
        //     $film->film_title = $request->film_titles;
        //     $film->prod_id = $request->film_producers;
        //     $film->gen_id = $request->film_genres;
        //     $film->summary = $request->film_contents;
        //     $film->release_date = $request->film_date_released;
        //     $film->country = $request->film_country;
        //     $film->image = $image_name;
        //     $film->save();

        //     $cnt = count($request->film_actor_id);
        //     $actormovie = Film_Actor::where('movie_id', $request->film_id)->delete();
        //     for($i = 0; $i < $cnt; $i++) {
        //         $film_actors = [
        //             'movie_id' => $film->id,
        //             'actor_id' => $request->film_actor_id[$i]
        //         ];
        //         DB::table('film_actor')->insert($film_actors);
        //     }
        //     return json_encode(array("status"=>"OK", "movie"=>$film));
        // }
        // else{
        //     $film = Movie::where('id', $request->film_id)->first();
        //     $film->film_title = $request->film_titles;
        //     $film->prod_id = $request->film_producers;
        //     $film->gen_id = $request->film_genres;
        //     $film->summary = $request->film_contents;
        //     $film->release_date = $request->film_date_released;
        //     $film->country = $request->film_country;
        //     $film->image = $request->old_poster;
        //     $film->save();

        //     $cnt = count($request->film_actor_id);
        //     $actormovie = Film_Actor::where('movie_id', $request->film_id)->delete();
        //     for($i = 0; $i < $cnt; $i++) {
        //         $film_actors = [
        //             'movie_id' => $film->id,
        //             'actor_id' => $request->film_actor_id[$i]
        //         ];
        //         DB::table('film_actor')->insert($film_actors);
        //     }
        //     return json_encode(array("status"=>"OK", "film_title"=>$film));
        // }
    }

    public function deleteFilm(Request $request)
    {
        // $actormovie = Actormovie::where('movie_id', $request->id)->delete();

        // $movie = Movie::where('id', $request->id)->first();
        // $movie->delete();

        // return json_encode(array("status"=>"OK", "film_title"=>$movie->title));

            $movie = Movie::where('id', $request->id)->first();
            $movie->delete();
    
            // return json_encode(array("status"=>"OK", "movietitle"=>$movie->title));
            Log::warning('Movie Deleted', [
                'id'=>$movie->id
            ]);
    
            return response()->json([
                "message" => "Movie deleted!"
            ], 202);
    }

    public function search(Request $request)
    {
        $movie = Movie::where('film_title', 'LIKE', "%$request->search%")->get();

        return json_encode($movie);
    }


    public function showFilmActor($id){
        $actorm = Film_Actor::with('actors')->where('movie_id', $id)->get();

        return response()->json([
            "film_actor" => $actorm
        ], 202);

    }

    public function showActorFilm($id){
        $actorfilm = Film_Actor::with('movie')->where('actor_id', $id)->get();

        return response()->json([
            "actor_film" => $actorfilm
        ], 202);
    }
}
