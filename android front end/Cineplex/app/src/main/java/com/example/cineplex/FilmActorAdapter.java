package com.example.cineplex;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.ArrayList;

public class FilmActorAdapter extends RecyclerView.Adapter<FilmActorAdapter.ViewHolder>
{
    Context context;
    ArrayList<Actor> actorm = new ArrayList<Actor>();

    public FilmActorAdapter(Context context) {
        this.context = context;
    }
    public void setActorm(ArrayList<Actor> actorm) {
        this.actorm = actorm;
        notifyDataSetChanged();
    }


    @NonNull
    @Override
    public FilmActorAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View view = LayoutInflater.from(context).inflate(R.layout.activity_film_actor_adapter, parent, false);
        return new FilmActorAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull FilmActorAdapter.ViewHolder holder, int position) {
        holder.fname.setText(actorm.get(position).getFname());
        holder.lname.setText(actorm.get(position).getLname());

    }

    @Override
    public int getItemCount() {
        return actorm.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {

        TextView lname, fname;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);

            fname = itemView.findViewById(R.id.txtfname);
            lname = itemView.findViewById(R.id.txtlname);
        }
    }
}