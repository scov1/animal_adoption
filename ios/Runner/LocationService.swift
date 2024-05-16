import Flutter
import UIKit
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    var result: FlutterResult?

    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getLocation" {
            self.result = result
            locationManager?.requestWhenInUseAuthorization()
            locationManager?.startUpdatingLocation()
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let locationData: [String: Any] = [
                "latitude": latitude,
                "longitude": longitude
            ]
          
            self.result?(locationData)
            self.result = nil
        }
    }
}