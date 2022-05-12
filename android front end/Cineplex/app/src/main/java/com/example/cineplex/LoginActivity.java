package com.example.cineplex;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class LoginActivity extends AppCompatActivity {

    private EditText txtEmail, txtPassword, editSignup;
    private CheckBox cbxRemember;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        Button btnLogin = (Button) findViewById(R.id.btnLogin);
        Button btnSignup =(Button) findViewById(R.id.btn_signup);

        txtEmail = (EditText) findViewById(R.id.txtname);
        txtPassword = (EditText) findViewById(R.id.txtusername);
        cbxRemember = (CheckBox) findViewById(R.id.cbxRemember);

        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);

        String email = pref.getString("email", "");
        String password = pref.getString("password", "");

        if (email!="" && password!="") {

            txtEmail.setText(email);
            txtPassword.setText(password);

        }
            btnLogin.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    login();
                }
            });

        btnSignup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(LoginActivity.this, RegisterActivity.class);
                startActivity(intent);
//                remove the finish() here
            }
        });
    }

    private void login() {
        RequestQueue queue = Volley.newRequestQueue(this);
        String url = getString(R.string.apiURL)+"login";
        System.out.println(url);

        JSONObject logininfo = new JSONObject();
        try {
            logininfo.put("email", txtEmail.getText().toString());
            logininfo.put("password", txtPassword.getText().toString());
        } catch (JSONException e) {
            e.printStackTrace();
        }

        System.out.println(logininfo);

        JsonObjectRequest request = new JsonObjectRequest(Request.Method.POST,
                url,
                logininfo,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
                        SharedPreferences.Editor editor = pref.edit();

                        if (cbxRemember.isChecked()) {
                            editor.putString("email", txtEmail.getText().toString());
                            editor.putString("password", txtPassword.getText().toString());
                            try {
                                editor.putString("token", response.getString("token"));
                                loadMain(response.getString("user"));
                            } catch (JSONException e) {
                                e.printStackTrace();

                            }



                            editor.commit();
//                            loadMain();
                        } else {
                            try {
                                editor.putString("email", "");
                                editor.putString("password", "");
                                editor.putString("token", response.getString("token"));
                                loadMain(response.getString("user"));
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                            //change to commit
                            editor.commit();
//                            loadMain();
                        }

                    }
                }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                error.printStackTrace();
            }
        });
        queue.add(request);
    }

    public void loadMain(String user){
        Intent intent = new Intent(LoginActivity.this, MainActivity.class);
        intent.putExtra("name", user);
        startActivity(intent);
        finish();
    }
}