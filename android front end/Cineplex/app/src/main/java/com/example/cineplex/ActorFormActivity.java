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
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static com.example.cineplex.MainActivity.customToast;

public class ActorFormActivity extends AppCompatActivity {
    private static final int PICK_IMAGE_RESULT = 143;
    Bitmap bitmap;
    Uri filepath;
    int method;


    EditText editActorFname,editActorLname,editActorAge,editActorGender;
    Button btnSaveActor, btnUpload,btnCameraActor;
    String age,fname,lname,gender;
    int id;
    String image;
    String url = "http://192.168.100.14:8000/api/actors";
    ImageView imageActor;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_actor_form);

        editActorFname = findViewById(R.id.editActorFname);
        editActorLname = findViewById(R.id.editActorLname);
        editActorAge = findViewById(R.id.editActorAge);
        editActorGender = findViewById(R.id.editActorGender);
        btnSaveActor = findViewById(R.id.btnSaveActor);
        btnCameraActor = findViewById(R.id.btnCameraActor);

        btnUpload = findViewById(R.id.btnUpload);
        imageActor = findViewById(R.id.imageActor);

        if(getIntent().hasExtra("id")){
            method = Request.Method.PUT;
            id = getIntent().getIntExtra("id",0);
            fname = getIntent().getStringExtra("firstname");
            lname = getIntent().getStringExtra("lastname");
            age = getIntent().getStringExtra("age");
            gender = getIntent().getStringExtra("gender");

            editActorAge.setText(age);
            editActorFname.setText(fname);
            editActorLname.setText(lname);
            editActorGender.setText(gender);

            Picasso.get().load("http://192.168.100.14:8000/storage/img/actor_posters/" + getIntent().getStringExtra("image")).placeholder(R.drawable.actor).into(imageActor);
            url = "http://192.168.100.14:8000/api/actors" + id;
        }
        btnUpload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent();
                intent.setType("image/*");
                intent.setAction(Intent.ACTION_GET_CONTENT);
                startActivityForResult(Intent.createChooser(intent, "Click Image"),PICK_IMAGE_RESULT);
            }
        });

        btnSaveActor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendActorData();
            }
        });


        //for actor camera
        if(ContextCompat.checkSelfPermission(ActorFormActivity.this, Manifest.permission.CAMERA) != PackageManager.PERMISSION_GRANTED){
            ActivityCompat.requestPermissions((ActorFormActivity.this),
                    new String[]{
                            Manifest.permission.CAMERA
                    }, 100);
        }
        btnCameraActor.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
                startActivityForResult(intent, 100);
            }
        });

    }

    //camera
    public Uri getImageUri(Context inContext, Bitmap inImage){
        ByteArrayOutputStream byt = new ByteArrayOutputStream();
        inImage.compress(Bitmap.CompressFormat.JPEG, 100, byt);
        String path = MediaStore.Images.Media.insertImage(inContext.getContentResolver(), inImage, "Title", null);
        return Uri.parse(path);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        //camera
        if (requestCode == 100){
            Bitmap captureimg = (Bitmap) data.getExtras().get("data");
            Uri tempUri = getImageUri(getApplicationContext(), captureimg);

            try {
                bitmap = MediaStore.Images.Media.getBitmap(getContentResolver(), tempUri);
                Picasso.get().load(tempUri).fit().centerCrop().into(imageActor);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //poster
        if(requestCode == 143){
            filepath = data.getData();
            try {
                bitmap = MediaStore.Images.Media.getBitmap(getContentResolver(),filepath);
                Picasso.get().load(filepath).fit().centerCrop().into(imageActor);
                imageActor.setImageBitmap(bitmap);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }

    //
    public String getStringImage(Bitmap bmp){
        ByteArrayOutputStream B_array = new ByteArrayOutputStream();
        bmp.compress(Bitmap.CompressFormat.JPEG, 100, B_array);
        byte[] image_byte = B_array.toByteArray();
        String image_encoded = Base64.encodeToString(image_byte, Base64.DEFAULT);
        return image_encoded;
    }

    private void sendActorData() {

        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
        SharedPreferences pref = getSharedPreferences("Cineplex", Activity.MODE_PRIVATE);
        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("Fname" , editActorFname.getText().toString());
            jsonObject.put("Lname",editActorLname.getText().toString());
            jsonObject.put("age",editActorAge.getText().toString());
            jsonObject.put("Gender",editActorGender.getText().toString());
            jsonObject.put("imageView_Actor", getStringImage(bitmap));
            jsonObject.put("image", editActorFname.getText().toString().replaceAll("\\s+","") + ".jpg");
            jsonObject.put("id",id);
        } catch (JSONException e) {
            e.printStackTrace();
        }

        String url = getString(R.string.apiURL) + "actors";
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
                            customToast(ActorFormActivity.this,response.getString("message"),R.drawable.ic_baseline_add_circle_24);
//                            Toast.makeText(ActorFormActivity.this, response.getString("message"), Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(ActorFormActivity.this, ActorActivity.class);
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