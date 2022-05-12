package com.example.cineplex;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ActorInfoActivity extends AppCompatActivity {
    TextView txtfname, txtlname, txtgen, txtage;
    ImageView imageActor;

    RecyclerView rvActorFilm;
    int actor_id;
    ArrayList<Movie> actors_film = new ArrayList<Movie>();
    ActorFilmAdapter actorfilmAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actor_info);
        txtfname = findViewById(R.id.txtViewActorFname);
        txtlname = findViewById(R.id.txtViewActorLname);
        txtgen = findViewById(R.id.txtViewActorGen);
        txtage = findViewById(R.id.txtViewActorAge);
        imageActor = findViewById(R.id.txtViewActorImg);

        Intent intent = getIntent();
        String fname = intent.getStringExtra("firstname");
        String lname = intent.getStringExtra("lastname");
        String gen = intent.getStringExtra("gender");
        String age = intent.getStringExtra("age");
        String img = intent.getStringExtra("image");

        txtfname.setText(fname);
        txtlname.setText(lname);
        txtgen.setText(gen);
        txtage.setText(age);
        Picasso.get().load(img).into(imageActor);
        Log.i("url", "test" + img);

        rvActorFilm = findViewById(R.id.rvActorFilm);
        actor_id = intent.getIntExtra("actorid", 0);
        showActorFilm();

        actorfilmAdapter = new ActorFilmAdapter(getApplicationContext());
        rvActorFilm.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        rvActorFilm.setAdapter(actorfilmAdapter);
    }

    private void showActorFilm() {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "movies/showmovie/" + actor_id,
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray jsonArray = response.getJSONArray("actor_film");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                JSONObject jsObject = jsonObject.getJSONObject("movie");
                                Movie movie = new Movie();
                                movie.setTitle(jsObject.getString("film_title"));
                                actors_film.add(movie);

                            }

                            actorfilmAdapter.setActors_film(actors_film);
                        } catch (JSONException jsonException) {
                            jsonException.printStackTrace();
                        }

                    }

                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("VolleyError", error.toString());
                    }
                })
        {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<>();
                String token = pref.getString("token",null);
                headers.put("Authorization", "Bearer "+ token);
                System.out.println(headers);
                return headers;
            }
        };

        requestQueue.add(jsonObjectRequest);
    }
}