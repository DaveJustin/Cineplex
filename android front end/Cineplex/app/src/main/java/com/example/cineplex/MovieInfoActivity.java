package com.example.cineplex;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

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

import static com.example.cineplex.MainActivity.customToast;

public class MovieInfoActivity extends AppCompatActivity {


    TextView txtTitle, txtContent, txtDate, txtCountry;
    ImageView imageMovie;
    Button btnFilmActorAdd;

    RecyclerView rvFilmActor;
    int movie_id;
    ArrayList<Actor> filmactor = new ArrayList<Actor>();
    FilmActorAdapter actormAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movie_info);

        txtTitle = findViewById(R.id.txtViewFilmTitle);
        txtContent = findViewById(R.id.txtViewFilmSummary);
        txtDate = findViewById(R.id.txtViewFilmDate);
        txtCountry = findViewById(R.id.txtViewFilmCountry);
        imageMovie = findViewById(R.id.txtViewFilmImg);
        btnFilmActorAdd = findViewById(R.id.btnFilmActorAdd);


        Intent intent = getIntent();

        String title = intent.getStringExtra("film_title");
        String content = intent.getStringExtra("summary");
        String date = intent.getStringExtra("release_date");
        String country = intent.getStringExtra("country");
        String img = intent.getStringExtra("image");
        int movieid = intent.getIntExtra("id", 0);


        txtTitle.setText(title);
        txtContent.setText(content);
        txtDate.setText(date);
        txtCountry.setText(country);


        Picasso.get().load(img).into(imageMovie);
        Log.i("url", "test" + img);

        rvFilmActor = findViewById(R.id.rvFilmActor);
//        Intent intent = getIntent();
        movie_id = intent.getIntExtra("id", 0);
        showFilmActor();

        actormAdapter = new FilmActorAdapter(getApplicationContext());
        rvFilmActor.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        rvFilmActor.setAdapter(actormAdapter);

//        String imageurl = "http://192.168.100.14:8000/storage/img/movies_poster/" + title+".jpg";
//        Picasso.get().load(imageurl).placeholder(R.drawable.cineplex_logo2).into(imageMovie);

        btnFilmActorAdd.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MovieInfoActivity.this, Film_Actor_Add.class);
                intent.putExtra("movieid", movieid);
                intent.putExtra("title", title);
                startActivity(intent);

            }
        });

    }

    public void showFilmActor(){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "movies/showactor/" + movie_id,
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray jsonArray = response.getJSONArray("film_actor");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                JSONObject jsObject = jsonObject.getJSONObject("actors");
                                Actor actor = new Actor();
                                actor.setFname(jsObject.getString("firstname"));
                                actor.setLname(jsObject.getString("lastname"));
                                filmactor.add(actor);
//                                Toast.makeText(ActorMovieRecyclerView.this, jsObject.getString("firstname"), Toast.LENGTH_SHORT).show();
//                            Log.e("firstname", jsObject.getString(("firstname")));
                            }

                            actormAdapter.setActorm(filmactor);
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