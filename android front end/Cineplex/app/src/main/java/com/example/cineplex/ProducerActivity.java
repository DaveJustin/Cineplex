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

public class ProducerActivity extends AppCompatActivity {
    RecyclerView rvProducer;
    ArrayList<Producer> producers = new ArrayList<Producer>();
    ProducerRecyclerViewAdapter producerAdapter;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_producer);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        rvProducer = findViewById(R.id.rvMovie);
        producerAdapter = new ProducerRecyclerViewAdapter(getApplicationContext());
        rvProducer.setLayoutManager(new LinearLayoutManager(getApplicationContext()));
        rvProducer.setAdapter(producerAdapter);
        getProducers();

        FloatingActionButton fab = findViewById(R.id.fabmovie);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(ProducerActivity.this,ProducerFormActivity.class);
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
            Intent movieintent = new Intent(ProducerActivity.this, MainActivity.class);
            startActivity(movieintent);
        }
        else if(id == R.id.actor) {
            Intent actorintent = new Intent(ProducerActivity.this, ActorActivity.class);
            startActivity(actorintent);
        }else if(id == R.id.producer) {
            Intent producerintent = new Intent(ProducerActivity.this, ProducerActivity.class);
            startActivity(producerintent);
        }
        else if(id == R.id.logout) {
            logout();
        }
        return super.onOptionsItemSelected(item);
    }

    public void getProducers(){

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "producers",
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        //after maaccess data eto ung function na mag rurun. tinatawag siang callback

                        try {
                            JSONArray jsonArray = response.getJSONArray("producer_array");

                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                Producer producer = new Producer(jsonObject.getString("first_name"),
                                        jsonObject.getString("last_name"),
                                        jsonObject.getString("age"),
                                        jsonObject.getInt("id"));

                                producers.add(producer);
//                                Toast.makeText(ProducerActivity.this, jsonObject.getString("age"),Toast.LENGTH_SHORT).show();
                            }
                            producerAdapter.setProducers(producers);
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

                    Intent intent = new Intent(ProducerActivity.this, LoginActivity.class);
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