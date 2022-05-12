
package com.example.cineplex;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
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

public class ActorRecyclerViewAdapter extends RecyclerView.Adapter<ActorRecyclerViewAdapter.ViewHolder>{
    Context context;
    ArrayList<Actor> actors = new ArrayList<Actor>();
    String url = "http://192.168.100.14:8000/storage/img/actor_posters/";
    public ActorRecyclerViewAdapter(Context context) {
        this.context = context;
    }

    public void setActors(ArrayList<Actor> actors) {
        this.actors = actors;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ActorRecyclerViewAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.actor_item,parent,false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ActorRecyclerViewAdapter.ViewHolder holder, int position) {
        holder.txtActorFname.setText(actors.get(position).getFname());
        holder.txtActorLname.setText(actors.get(position).getLname());
        holder.txtActorAge.setText(actors.get(position).getAge());
        holder.txtActorGender.setText(actors.get(position).getGender());

        String imageurl = "http://192.168.100.14:8000/storage/img/actor_posters/" + actors.get(position).getImage();
//        Picasso.get().load("http://192.168.100.14:8000/storage/img/actor_posters/" + actors.get(position).getImage()).placeholder(R.drawable.actor).into(holder.view_Image_Actor);
        Picasso.get().load(imageurl).placeholder(R.drawable.actor).into(holder.view_Image_Actor);


        holder.btnEdit_Actor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Toast.makeText(context, "to edit", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(context, ActorFormActivity.class);
                intent.putExtra("id", actors.get(position).getId());
                intent.putExtra("firstname", actors.get(position).getFname());
                intent.putExtra("lastname",actors.get(position).getLname());
                intent.putExtra("age",actors.get(position).getAge());
                intent.putExtra("gender",actors.get(position).getGender());
                intent.putExtra("image",actors.get(position).getImage());
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

                context.startActivity(intent);
            }
        });

        holder.btnDelete_Actor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                deleteActor(actors.get(position).getId(),position);
                deleteActor(actors.get(position).getId(),position);
            }
        });

        holder.view_Image_Actor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(context, ActorInfoActivity.class);
                intent.putExtra("id",actors.get(position).getId());
                intent.putExtra("firstname",actors.get(position).getFname());
                intent.putExtra("lastname",actors.get(position).getLname());
                intent.putExtra("gender",actors.get(position).getGender());
                intent.putExtra("age",actors.get(position).getAge());
                intent.putExtra("image",url + actors.get(position).getImage());

                int actorid = intent.getIntExtra("id", 0);
                intent.putExtra("actorid", actorid);

                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
        });
    }

    private void deleteActor(int id, final int index) {

        RequestQueue requestQueue = Volley.newRequestQueue(context.getApplicationContext());
        SharedPreferences pref = context.getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("id",id);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                Request.Method.POST,
                context.getString(R.string.apiURL) + "actors/delete",
                jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            Toast.makeText(context, response.getString("message"), Toast.LENGTH_SHORT).show();
                            actors.remove(index);
                            notifyDataSetChanged();
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
                }){
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

    @Override
    public int getItemCount() {
        return actors.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        TextView txtActorFname,txtActorLname,txtActorGender,txtActorAge;
        Button btnEdit_Actor,btnDelete_Actor;
        ImageView view_Image_Actor;
        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            txtActorFname = itemView.findViewById(R.id.txtActorFname);
            txtActorLname = itemView.findViewById(R.id.txtActorLname);
            txtActorAge = itemView.findViewById(R.id.txtActorAge);
            txtActorGender = itemView.findViewById(R.id.txtActorGender);

            btnEdit_Actor = itemView.findViewById(R.id.btnEditActor);
            btnDelete_Actor = itemView.findViewById(R.id.btnDeleteActor);
            view_Image_Actor = itemView.findViewById(R.id.imageView_Actor);

        }
    }
}
