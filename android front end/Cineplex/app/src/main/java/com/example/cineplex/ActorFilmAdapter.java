package com.example.cineplex;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class ActorFilmAdapter extends RecyclerView.Adapter<ActorFilmAdapter.ViewHolder> {
    Context context;
    ArrayList<Movie> actors_film = new ArrayList<Movie>();

    public ActorFilmAdapter(Context context) {
        this.context = context;
    }

    public void setActors_film(ArrayList<Movie> actors_film) {
        this.actors_film = actors_film;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ActorFilmAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.activity_actor_film_adapter, parent, false);
        return new ActorFilmAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ActorFilmAdapter.ViewHolder holder, int position) {
        holder.txtActorFilm.setText(actors_film.get(position).getTitle());
    }

    @Override
    public int getItemCount() {
        return actors_film.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
        TextView txtActorFilm;
        public ViewHolder(@NonNull  View itemView) {
            super(itemView);
            txtActorFilm = itemView.findViewById(R.id.txtactorfilm);
        }
    }
}
