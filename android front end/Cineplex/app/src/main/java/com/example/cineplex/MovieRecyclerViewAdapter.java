package com.example.cineplex;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;
import com.squareup.picasso.Picasso;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MovieRecyclerViewAdapter extends RecyclerView.Adapter<MovieRecyclerViewAdapter.ViewHolder> {

    Context context;
    ArrayList<Movie> movies = new ArrayList<Movie>();
    String url = "http://192.168.100.14:8000/storage/img/movies_poster/";

    public MovieRecyclerViewAdapter(Context context){
        this.context = context;
    }

    public void setMovies(ArrayList<Movie> movies){
        this.movies = movies;
        notifyDataSetChanged();
    }

    public MovieRecyclerViewAdapter(ArrayList<Movie> movies){
        this.movies = movies;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.movie_item, parent, false);
        return new MovieRecyclerViewAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MovieRecyclerViewAdapter.ViewHolder holder, int position) {
        holder.txttitle.setText(movies.get(position).getTitle());
        holder.txtdate.setText(movies.get(position).getDate_release());
        holder.txtcontent.setText(movies.get(position).getContent());
//        Picasso.get().load("http://192.168.100.14:8000/storage/img/movies_posters/" + movies.get(position).getImg()).placeholder(R.drawable.cineplex_logo2).into(holder.imgMovie);

        String imageurl = "http://192.168.100.14:8000/storage/img/movies_poster/" + movies.get(position).getImg();
//        Picasso.get().load("http://192.168.100.14:8000/storage/img/actor_posters/" + actors.get(position).getImage()).placeholder(R.drawable.actor).into(holder.view_Image_Actor);
        Picasso.get().load(imageurl).placeholder(R.drawable.cineplex_logo2).into(holder.imgMovie);

        holder.imgMovie.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, MovieInfoActivity.class);
                intent.putExtra("id",movies.get(position).getId());
                intent.putExtra("film_title",movies.get(position).getTitle());
                intent.putExtra("release_date",movies.get(position).getDate_release());
                intent.putExtra("country",movies.get(position).getCountry_release());
                intent.putExtra("summary",movies.get(position).getContent());
                intent.putExtra("image",url + movies.get(position).getImg());

                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
        });

        holder.btneditM.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, MovieFormAcitvity.class);
                intent.putExtra("id",movies.get(position).getId());
                intent.putExtra("film_title",movies.get(position).getTitle());
                intent.putExtra("release_date",movies.get(position).getDate_release());
                intent.putExtra("country",movies.get(position).getCountry_release());
                intent.putExtra("summary",movies.get(position).getContent());
                intent.putExtra("image",url + movies.get(position).getImg());

                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
        });

        holder.btndeleteM.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                deleteMovie(movies.get(position).getId(),position);
            }
        });
    }

    private void deleteMovie(int id, final int index) {
        RequestQueue requestQueue = Volley.newRequestQueue(context.getApplicationContext());
        SharedPreferences pref = context.getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JSONObject jsonObject = new JSONObject();
        try{
            jsonObject.put("id", id);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.POST,
                context.getString(R.string.apiURL)+ "movies/delete",
                jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            Toast.makeText(context, response.getString("message"), Toast.LENGTH_LONG).show();

                            movies.remove(index);
                            notifyDataSetChanged();

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
            }}; requestQueue.add(jsonObjectRequest);
    }

    @Override
    public int getItemCount() {
        return movies.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView txttitle, txtdate, txtcontent;
        ImageButton btneditM, btndeleteM;
        ImageView imgMovie;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            txttitle = itemView.findViewById(R.id.txtFilmTitle);
            txtdate = itemView.findViewById(R.id.txtFilmReleasedDate);
            txtcontent = itemView.findViewById(R.id.txtFilmSummary);
            btneditM = itemView.findViewById(R.id.btnEditFilm);
            btndeleteM = itemView.findViewById(R.id.btnDeleteFilm);
            imgMovie = itemView.findViewById(R.id.imgFilm);
        }
    }
}