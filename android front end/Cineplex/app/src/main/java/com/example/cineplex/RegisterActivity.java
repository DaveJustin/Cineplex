package com.example.cineplex;

        import androidx.appcompat.app.AppCompatActivity;

        import android.app.Activity;
        import android.content.Intent;
        import android.content.SharedPreferences;
        import android.os.Bundle;
        import android.util.Log;
        import android.view.View;
        import android.widget.Button;
        import android.widget.EditText;
        import android.widget.TextView;

        import com.android.volley.AuthFailureError;
        import com.android.volley.Request;
        import com.android.volley.RequestQueue;
        import com.android.volley.Response;
        import com.android.volley.VolleyError;
        import com.android.volley.toolbox.JsonObjectRequest;
        import com.android.volley.toolbox.Volley;

        import org.json.JSONException;
        import org.json.JSONObject;

        import java.util.HashMap;
        import java.util.Map;


public class RegisterActivity extends AppCompatActivity {
    private Button btnregister;
    private TextView btnlogin;
    private EditText tname, temail, tpass, tuname;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        btnlogin = findViewById(R.id.txtback);
        btnregister = findViewById(R.id.btnrResigter);
        tname = findViewById(R.id.txtrname);
        tuname = findViewById(R.id.txtrusername);
        temail = findViewById(R.id.txtremail);
        tpass = findViewById(R.id.txtrpassword);

        backlogin();
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        btnregister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                register();
            }
        });

    }

    private void backlogin() {
        btnlogin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
//                finish only
                finish();
            }
        });

    }

    private void register() {
        RequestQueue queue = Volley.newRequestQueue(this);
        String url = getString(R.string.apiURL)+"register";

        JSONObject registerDetails = new JSONObject();
        try {
            registerDetails.put("name", tname.getText().toString());
            registerDetails.put("username", tuname.getText().toString());
            registerDetails.put("email", temail.getText().toString());
            registerDetails.put("password", tpass.getText().toString());

        } catch (JSONException e) {
            e.printStackTrace();
        }

        System.out.println(registerDetails);

        JsonObjectRequest request = new JsonObjectRequest(
                Request.Method.POST,
                url,
                registerDetails,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();
                        try {


                            editor.putString("name", tname.getText().toString());
                            editor.putString("username", tuname.getText().toString());
                            editor.putString("email", temail.getText().toString());
                            editor.putString("password", tpass.getText().toString());

                                editor.putString("token", response.getString("token"));
                                loadMain(response.getString("user"));

                            editor.commit();


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }

                    }

                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
            }
        }){
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                Map<String, String> headers = new HashMap<>();
                SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
                String token = pref.getString("token",null);
                headers.put("Authorization", "Bearer "+ token);
                System.out.println(headers);
                return headers;
            }
        };
        queue.add(request);
    }




    public void loadMain(String user){
        Intent intent = new Intent(RegisterActivity.this, MainActivity.class);
        intent.putExtra("name", user);
        startActivity(intent);
        finish();
    }

}