import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

    private let CHANNEL = "call_bridge"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let controller = window?.rootViewController as! FlutterViewController

        let channel = FlutterMethodChannel(
            name: CHANNEL,
            binaryMessenger: controller.binaryMessenger
        )

        channel.setMethodCallHandler { call, result in

            if call.method == "makeCall" {
                print("makeCall from iphone start")

                if let args = call.arguments as? [String: Any],
                   let phoneNumber = args["phoneNumber"] as? String {
                    dump(call.arguments)

                    if let url = URL(string: "tel://\(phoneNumber)") {
                        print("makeCall from iphone: tel://\(phoneNumber)")

                        UIApplication.shared.open(url)

                        result(nil)
                    }
                }

            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        GeneratedPluginRegistrant.register(with: self)

        return super.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
    }
}
