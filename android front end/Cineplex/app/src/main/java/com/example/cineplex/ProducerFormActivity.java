package com.example.cineplex;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import static com.example.cineplex.MainActivity.customToast;

public class ProducerFormActivity extends AppCompatActivity {
    EditText editProdFname,editProdLname,editProdAge;
    Button btnSaveProducer;
    String age,fname,lname;
    int id;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_producer_form);
        editProdFname = findViewById(R.id.editProdFname);
        editProdLname = findViewById(R.id.editProdLname);
        editProdAge = findViewById(R.id.editProdAge);
        btnSaveProducer = findViewById(R.id.btnSaveProd);

        if(getIntent().hasExtra("id")){
            id = getIntent().getIntExtra("id", 0);
            fname = getIntent().getStringExtra("first_name");
            lname = getIntent().getStringExtra("last_name");
            age = getIntent().getStringExtra("age");
            editProdAge.setText(age);
            editProdFname.setText(fname);
            editProdLname.setText(lname);
        }

        btnSaveProducer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendProducerData();
            }
        });
    }

    private void sendProducerData() {
        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JSONObject jsonObject = new JSONObject();

        try {
            jsonObject.put("Fname" , editProdFname.getText().toString());
            jsonObject.put("Lname",editProdLname.getText().toString());
            jsonObject.put("Age",editProdAge.getText().toString());
            jsonObject.put("id",id);
        } catch (JSONException e) {
            e.printStackTrace();
        }


        String url = getString(R.string.apiURL) + "producers";
        if(id != 0){
           url += "/update";

        }else{
            url += "/save";
        }

        // (statement) ? true:false
        JsonObjectRequest jsonObjectRequest = new JsonObjectRequest(
                (id != 0) ? Request.Method.PUT:Request.Method.POST,
                url,
                jsonObject,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        try {

                            customToast(ProducerFormActivity.this,response.getString("message"),R.drawable.ic_baseline_add_circle_24);
//                            Toast.makeText(ProducerFormActivity.this, response.getString("message"), Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(ProducerFormActivity.this, ProducerActivity.class);
                            startActivity(intent);
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
}