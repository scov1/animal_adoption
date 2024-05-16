package com.example.animal_adoption

import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.location.LocationManager
import android.location.LocationListener
import android.location.Location
import io.flutter.plugin.common.MethodCall
import android.os.Bundle

class LocationPlugin(private val context: Context, private val flutterEngine: FlutterEngine) : MethodChannel.MethodCallHandler {
    companion object {
        const val CHANNEL = "location_channel"
    }

    private val locationManager: LocationManager by lazy {
        context.getSystemService(Context.LOCATION_SERVICE) as LocationManager
    }

    init {
        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getLocation") {
            getLocation(result)
        } else {
            result.notImplemented()
        }
    }

    private fun getLocation(result: MethodChannel.Result) {
        val locationListener = object : LocationListener {
            override fun onLocationChanged(location: Location) {
                result.success(mapOf("latitude" to location.latitude, "longitude" to location.longitude))
                locationManager.removeUpdates(this)
            }

            override fun onStatusChanged(provider: String?, status: Int, extras: Bundle?) {}

            override fun onProviderEnabled(provider: String) {}

            override fun onProviderDisabled(provider: String) {}
        }
        

        if (context.checkSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION) == android.content.pm.PackageManager.PERMISSION_GRANTED ||
            context.checkSelfPermission(android.Manifest.permission.ACCESS_COARSE_LOCATION) == android.content.pm.PackageManager.PERMISSION_GRANTED) {
            locationManager.requestSingleUpdate(LocationManager.GPS_PROVIDER, locationListener, null)
        } else {
            result.error("PERMISSION_DENIED", "Location permission not granted", null)
        }
    }
}
