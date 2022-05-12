package com.example.cineplex;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;

import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    private SharedPreferences pref;
    RecyclerView rcMovie;
    MovieRecyclerViewAdapter movieAdapter;
    ArrayList<Movie> movies = new ArrayList<Movie>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);


        rcMovie = findViewById(R.id.rvMovie);
        movieAdapter = new MovieRecyclerViewAdapter(getApplicationContext());
        rcMovie.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        rcMovie.setAdapter(movieAdapter);
        getMovie();

        pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        customToast(MainActivity.this,"Logged In! Remembered",R.drawable.ic_baseline_add_circle_24);

        Intent intent = getIntent();
        System.out.println(intent.getStringExtra("name"));
//        Toast.makeText(this, intent.getStringExtra("name"), Toast.LENGTH_SHORT).show();

        FloatingActionButton fab = findViewById(R.id.fabmovie);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(MainActivity.this, MovieFormAcitvity.class);
                startActivity(intent);
            }
        });
    }

    private void getMovie() {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());

        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "movies",
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray jsonArray = response.getJSONArray("movies");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                Movie movie = new Movie();
                                movie.setTitle(jsonObject.getString("film_title"));
                                movie.setDate_release(jsonObject.getString("release_date"));
                                movie.setContent(jsonObject.getString("summary"));
                                movie.setCountry_release(jsonObject.getString("country"));
                                movie.setGenre_id(jsonObject.getInt("gen_id"));
                                movie.setProducer_id(jsonObject.getInt("prod_id"));
                                movie.setImg(jsonObject.getString("image"));
                                movie.setId(jsonObject.getInt("id"));
                                movies.add(movie);

                            }
                            movieAdapter.setMovies(movies);
                        } catch (JSONException e) {
                            e.printStackTrace();
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


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        //path ng mga pupuntahan

        int id = item.getItemId();
        //noinspection SimplifiableIfStatement
        if (id == R.id.movie) {
            Intent movieintent = new Intent(MainActivity.this, MainActivity.class);
            startActivity(movieintent);
        }
        else if(id == R.id.actor) {
            Intent actorintent = new Intent(MainActivity.this, ActorActivity.class);
            startActivity(actorintent);
        }else if(id == R.id.producer) {
            Intent producerintent = new Intent(MainActivity.this, ProducerActivity.class);
            startActivity(producerintent);
        }
        else if(id == R.id.logout) {
            logout();
        }
        return super.onOptionsItemSelected(item);
    }


    public static void customToast(Activity activity, String toastMessage, int drawable_id){

        LayoutInflater inflater = (LayoutInflater) activity.getSystemService(LAYOUT_INFLATER_SERVICE);
        View view = inflater.inflate(R.layout.custom_toast, (ViewGroup) activity.findViewById(R.id.customToast));
        Toast newToast = new Toast(activity.getApplicationContext());


        TextView toastText = view.findViewById(R.id.tvCustomToast);
        toastText.setText(toastMessage);
        toastText.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable_id,0,0,0);

        newToast.setDuration(Toast.LENGTH_SHORT);
        newToast.setGravity(Gravity.BOTTOM, 0,25);
        newToast.setView(view);
        newToast.show();
    }

    public void logout() {

        RequestQueue queue = Volley.newRequestQueue(getApplicationContext());

        String url = getString(R.string.apiURL)+"logout";
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);


        StringRequest request = new StringRequest(Request.Method.POST,url,
                response ->{

                    System.out.println(response );

                    SharedPreferences.Editor editor = pref.edit();
                    editor.clear();
                    editor.commit();

                    Intent intent = new Intent(MainActivity.this, LoginActivity.class);
                    startActivity(intent);
                    finish();

                },error -> {
            error.printStackTrace();
        }){

            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<>();
                String token = pref.getString("token",null);
                headers.put("Authorization", "Bearer "+ token);
                System.out.println(headers);
                return headers;
            }
        };

        queue.add(request);
    }

}