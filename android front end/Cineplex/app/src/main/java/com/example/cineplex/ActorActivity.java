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
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ActorActivity extends AppCompatActivity {
    RecyclerView rvActor;
    ArrayList<Actor> actors = new ArrayList<Actor>();
    ActorRecyclerViewAdapter actorAdapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actor);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        rvActor = findViewById(R.id.rvActor);
        actorAdapter = new ActorRecyclerViewAdapter(getApplicationContext());
        rvActor.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        rvActor.setAdapter(actorAdapter);
        getActors();

        FloatingActionButton fab = findViewById(R.id.fabmovie);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(ActorActivity.this,ActorFormActivity.class);
                startActivity(intent);
            }
        });
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
            Intent movieintent = new Intent(ActorActivity.this, MainActivity.class);
            startActivity(movieintent);
        }
        else if(id == R.id.actor) {
            Intent actorintent = new Intent(ActorActivity.this, ActorActivity.class);
            startActivity(actorintent);
        }else if(id == R.id.producer) {
            Intent producerintent = new Intent(ActorActivity.this, ProducerActivity.class);
            startActivity(producerintent);
        }
        else if(id == R.id.logout) {
         logout();
        }

        return super.onOptionsItemSelected(item);
    }


    public void getActors(){
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

                                        actor.setFname(jsonObject.getString("firstname"));
                                        actor.setLname(jsonObject.getString("lastname"));
                                        actor.setAge(jsonObject.getString("age"));
                                        actor.setGender(jsonObject.getString("gender"));
                                        actor.setId(jsonObject.getInt("id"));
                                        actor.setImage(jsonObject.getString("image"));
//                                        jsonObject.getString("lastname"),
//                                        jsonObject.getString("age"),
//                                        jsonObject.getString("gender"),
//                                        jsonObject.getString("image"),
//                                        String.valueOf(jsonObject.getInt("id")));

                                actors.add(actor);
//                               Toast.makeText(ActorActivity.this, jsonObject.getString("image"),Toast.LENGTH_SHORT).show();
                            }
                            actorAdapter.setActors(actors);
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Log.e("volleyError", error.toString());
                    }
                })

        {
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<>();
                String token = pref.getString("token", null);
                headers.put("Authorization", "Bearer " + token);
                System.out.println(headers);
                return headers;
            }
            };

        requestQueue.add(jsonObjectRequest);
    }
    public void logout() {
        RequestQueue queue = Volley.newRequestQueue(this);

        String url = getString(R.string.apiURL)+"logout";
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);


        StringRequest request = new StringRequest(Request.Method.POST,url,
                response ->{

                    System.out.println(response );

                    SharedPreferences.Editor editor = pref.edit();
                    editor.clear();
                    editor.commit();

                    Intent intent = new Intent(ActorActivity.this, LoginActivity.class);
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