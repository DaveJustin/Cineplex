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
import com.android.volley.toolbox.Volley;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.squareup.picasso.Picasso;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static com.example.cineplex.MainActivity.customToast;

public class Film_Actor_Add extends AppCompatActivity {

    Spinner actorm;
    ArrayList<String> actor_names = new ArrayList<String>();
    ArrayList<Actor> actors = new ArrayList<Actor>();
    ArrayAdapter<String> arrayAdapteract;
    TextView titlemovies;
    ImageView imgActor;
    int actor_id, movie_id;
    Button btnSave;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_film__actor__add);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        actorm = findViewById(R.id.addactorm);
        titlemovies = findViewById(R.id.titlemovie);
        imgActor = findViewById(R.id.imgActor);
        btnSave = findViewById(R.id.btnsaveactorm);
        getActor();

        Intent intent = getIntent();
        String titlemovie = intent.getStringExtra("title");
        movie_id = intent.getIntExtra("movieid", 0);
        titlemovies.setText(titlemovie);

        actorm.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                get_Specific_Actor_Img(actors.get(position).getId());
                actor_id = actors.get(position).getId();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                get_Specific_Actor_Img(actors.get(0).getId());
                actor_id = actors.get(0).getId();
            }
        });
        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveFilmActor();
            }
        });

    }


    public void getActor(){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "actors",
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray jsonArray = response.getJSONArray("actors_array");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                Actor actor = new Actor();
                                actor.setId(jsonObject.getInt("id"));
                                actor.setLname(jsonObject.getString("lastname"));
                                actors.add(actor);
                                actor_names.add(actor.getLname());

                                //Toast.makeText(ActorMovie.this, jsonObject.getString("lastname"), Toast.LENGTH_SHORT).show();
                            }
                            arrayAdapteract = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_spinner_item, actor_names);
                            arrayAdapteract.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            actorm.setAdapter(arrayAdapteract);
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
//                System.out.println(headers);
                return headers;
            }
        };

        requestQueue.add(jsonObjectRequest);
    }

    public void get_Specific_Actor_Img(int actorid){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "Specific_Actor/" + actorid,
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            Picasso.get().load("http://192.168.100.14:8000/storage/img/actor_posters/" + response.getString("image")).placeholder(R.drawable.actor).into(imgActor);
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
//                System.out.println(headers);
                return headers;
            }
        };

        requestQueue.add(jsonObjectRequest);
    }

    public void saveFilmActor(){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);

        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("actor_id", actor_id);
            jsonObject.put("movie_id",movie_id);
//            jsonObject.put("id",id);

        } catch (JSONException e) {
            e.printStackTrace();
        }

        String url = getString(R.string.apiURL) + "Specific_Actor/saveactor";

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.POST,
                url,
                jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            customToast(Film_Actor_Add.this,"Successfully Added!",R.drawable.ic_baseline_add_circle_24);

                            //Toast.makeText(ActorAddAct.this, response.getString("message"), Toast.LENGTH_LONG).show();
                            customToast(Film_Actor_Add.this, response.getString("message"),R.drawable.ic_baseline_add_circle_24);
                            Intent intent = new Intent(Film_Actor_Add.this, MainActivity.class);
                            startActivity(intent);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("volleyError", error.toString());
                    }
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

        requestQueue.add(jsonObjectRequest);
    }
}