package com.example.cineplex;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Spinner;
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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static com.example.cineplex.MainActivity.customToast;

public class MovieFormAcitvity extends AppCompatActivity {

    int method;
    private static final int PICK_IMAGE_RESULT = 143;
    Bitmap bitmap;
    Uri filepath;


    ArrayList<String> genre_names = new ArrayList<String>();
    ArrayList<Genre> genres = new ArrayList<Genre>();
    ArrayAdapter<String> arrayAdaptergen;

    ArrayList<String> prod_names = new ArrayList<String>();
    ArrayList<Producer> producers = new ArrayList<Producer>();
    ArrayAdapter<String> arrayAdapterprod;

    EditText txttitle, txtcontent, txtdate,txtcountry;
    Button btnSave, btnUpload,btnCameraFilm ;
    String title;
    String content;
    String date;
    String country;
    int id;
    String image;
    String url = "http://192.168.100.14:8000/api/actors";
    ImageView imagemovie;
    Spinner sproducer,sgenre;
    int genreid, prodid;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movie_form_acitvity);

        txttitle = findViewById(R.id.editFilmTitle);
        txtcontent = findViewById(R.id.txtcontentadd);
        txtdate = findViewById(R.id.editFilmDate);
        txtcountry = findViewById(R.id.editFilmCountry);
        btnSave = findViewById(R.id.btnSaveFilm);
        btnUpload = findViewById(R.id.btnUploadFilmImg);
        imagemovie = findViewById(R.id.editFilmImage);
        sproducer = findViewById(R.id.editFilmProducers);
        sgenre = findViewById(R.id.editFilmGenre);
        btnCameraFilm = findViewById(R.id.btnCameraFilm);

        getGenre();
        getProducer();

        if(getIntent().hasExtra("id")){
            method = Request.Method.PUT;
            id = getIntent().getIntExtra("id", 0);
            title = getIntent().getStringExtra("film_title");
            content = getIntent().getStringExtra("summary");
            date = getIntent().getStringExtra("release_date");
            country = getIntent().getStringExtra("country");
//          Toast.makeText(this, getIntent().getStringExtra("image"), Toast.LENGTH_SHORT).show();

            Picasso.get().load( getIntent().getStringExtra("image")).placeholder(R.drawable.cineplex_logo2).into(imagemovie);
            url = "http://192.168.100.14:8000/api/movies" + id;

            txttitle.setText(title);
            txtcontent.setText(content);
            txtdate.setText(date);
            txtcountry.setText(country);
        }
        btnSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendMovieData();
            }
        });
        btnUpload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.setType("image/*");
                intent.setAction(Intent.ACTION_GET_CONTENT);
                startActivityForResult(Intent.createChooser(intent, "Click Image"),PICK_IMAGE_RESULT);
            }
        });
        sgenre.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                genreid = genres.get(position).getId();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                genreid = genres.get(0).getId();
            }
        });
        sproducer.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                prodid = producers.get(position).getId();
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                prodid = producers.get(0).getId();
            }
        });

        //for film camera
        if(ContextCompat.checkSelfPermission(MovieFormAcitvity.this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions((MovieFormAcitvity.this),
                    new String[]{
                            Manifest.permission.CAMERA
                    }, 100);
        }
        btnCameraFilm.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(intent, 100);
            }
        });
    }

    public Uri getImageUri(Context inContext, Bitmap inImage){
        ByteArrayOutputStream byt = new ByteArrayOutputStream();
        inImage.compress(Bitmap.CompressFormat.JPEG, 100, byt);
        String path = MediaStore.Images.Media.insertImage(inContext.getContentResolver(), inImage, "Title", null);
        return Uri.parse(path);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 100){
            Bitmap captureimg = (Bitmap) data.getExtras().get("data");
            Uri tempUri = getImageUri(getApplicationContext(), captureimg);

            try {
                bitmap = MediaStore.Images.Media.getBitmap(getContentResolver(), tempUri);
                Picasso.get().load(tempUri).fit().centerCrop().into(imagemovie);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        if(requestCode == 143){
            filepath = data.getData();
            try {
                bitmap = MediaStore.Images.Media.getBitmap(getContentResolver(),filepath);
                Picasso.get().load(filepath).fit().centerCrop().into(imagemovie);
                imagemovie.setImageBitmap(bitmap);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    public String getStringImage(Bitmap bmp){
        ByteArrayOutputStream byeOS = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.JPEG, 100, byeOS);
        byte[] imgbytes = byeOS.toByteArray();
        String encodedimage = Base64.encodeToString(imgbytes, Base64.DEFAULT);
        return encodedimage;
    }

    private void sendMovieData() {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);

        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("title", txttitle.getText().toString());
            jsonObject.put("producer_id",prodid);
            jsonObject.put("genre_id", genreid);
            jsonObject.put("content", txtcontent.getText().toString());
            jsonObject.put("date_release", txtdate.getText().toString());
            jsonObject.put("country_release", txtcountry.getText().toString());
            jsonObject.put("imgMovie", getStringImage(bitmap));
            jsonObject.put("image", txttitle.getText().toString().replaceAll("\\s+","") + ".jpg");
            jsonObject.put("id",id);

        } catch (JSONException e) {
            e.printStackTrace();
        }


        String url = getString(R.string.apiURL) + "movies";
        if(id != 0){
            url += "/update";
        }else{
            url += "/save";
        }

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                (id != 0) ? Request.Method.PUT : Request.Method.POST,
                url,
                jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
//                            Toast.makeText(MovieFormAcitvity.this, response.getString("message"), Toast.LENGTH_LONG).show();
                            customToast(MovieFormAcitvity.this,response.getString("message"),R.drawable.ic_baseline_add_circle_24);
                            Intent intent = new Intent(MovieFormAcitvity.this, MainActivity.class);
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

    public void getGenre(){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "genres",
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray jsonArray = response.getJSONArray("genre");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                Genre genre = new Genre();
                                genre.setId(jsonObject.getInt("id"));
                                genre.setName(jsonObject.getString("genre_name"));
                                genres.add(genre);
                                genre_names.add(genre.getName());

                                //Toast.makeText(MovieActAdd.this, jsonObject.getString("name"), Toast.LENGTH_SHORT).show();
                            }
                            arrayAdaptergen = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_spinner_item, genre_names);
                            arrayAdaptergen.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            sgenre.setAdapter(arrayAdaptergen);
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

    public void getProducer(){
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.GET,
                getString(R.string.apiURL) + "producers",
                null,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            JSONArray jsonArray = response.getJSONArray("producer_array");
                            for (int i = 0; i < jsonArray.length(); i++) {
                                JSONObject jsonObject = jsonArray.getJSONObject(i);
                                Producer producer = new Producer();
                                producer.setId(jsonObject.getInt("id"));
                                producer.setLname(jsonObject.getString("last_name"));
                                producers.add(producer);
                                prod_names.add(producer.getLname());

                                //Toast.makeText(MovieActAdd.this, jsonObject.getString("lastname"), Toast.LENGTH_SHORT).show();
                            }
                            arrayAdapterprod = new ArrayAdapter<String>(getApplicationContext(), android.R.layout.simple_spinner_item, prod_names);
                            arrayAdapterprod.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            sproducer.setAdapter(arrayAdapterprod);
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