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
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.cardview.widget.CardView;
import androidx.recyclerview.widget.RecyclerView;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ProducerRecyclerViewAdapter extends RecyclerView.Adapter<ProducerRecyclerViewAdapter.ViewHolder> {
    Context context;
    ArrayList<Producer> producers = new ArrayList<Producer>();

    public ProducerRecyclerViewAdapter(Context context) {
        this.context = context;
    }

    public void setProducers(ArrayList<Producer> producers) {
        this.producers = producers;
        notifyDataSetChanged();
    }

    @NonNull
    @Override
    public ProducerRecyclerViewAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.producer_item,parent,false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ProducerRecyclerViewAdapter.ViewHolder holder, int position) {
        holder.txtProdname.setText(producers.get(position).getFname());
        holder.txtProducerLname.setText(producers.get(position).getLname());
        holder.txtProducerAge.setText(producers.get(position).getAge());

        holder.btnEdit_Prod.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //Toast.makeText(context, "to edit", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(context, ProducerFormActivity.class);
                intent.putExtra("id", producers.get(position).getId());
                intent.putExtra("first_name", producers.get(position).getFname());
                intent.putExtra("last_name",producers.get(position).getLname());
                intent.putExtra("age",producers.get(position).getAge());
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                context.startActivity(intent);
            }
        });

        holder.btnDelete_Prod.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                deleteProducer(producers.get(position).getId(),position);
            }
        });
    }

    private void deleteProducer(int id, final int index) {
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
                context.getString(R.string.apiURL) + "producers/delete",
                jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {
                            Toast.makeText(context, response.getString("message"), Toast.LENGTH_SHORT).show();
                            producers.remove(index);
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
        return producers.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder{
            TextView txtProdname,txtProducerLname,txtProducerAge;
            ImageView imgProducer;
            Button btnEdit_Prod,btnDelete_Prod;
            CardView producerCard;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            txtProdname = itemView.findViewById(R.id.txtProducerName);
            txtProducerLname = itemView.findViewById(R.id.txtProducerLname);
            txtProducerAge = itemView.findViewById(R.id.txtProducerAge);
            imgProducer = itemView.findViewById(R.id.imageView2);
            btnEdit_Prod = itemView.findViewById(R.id.btnEditProd);
            btnDelete_Prod = itemView.findViewById(R.id.btnDeleteProd);
            producerCard = itemView.findViewById(R.id.producerCard);

        }
    }
}
