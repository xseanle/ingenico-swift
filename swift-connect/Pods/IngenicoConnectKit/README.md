Ingenico Connect Swift SDK
=======================

The Ingenico Connect Swift SDK provides a convenient way to support a large number of payment methods inside your iOS app.
It supports iOS 8.0 and up out-of-the-box.
The Swift SDK comes with an [example app](https://github.com/Ingenico-ePayments/connect-sdk-client-swift-example) that illustrates the use of the SDK and the services provided by Ingenico ePayments on the GlobalCollect platform.

See the [Ingenico Connect Developer Hub](https://developer.globalcollect.com/documentation/sdk/mobile/swift/) for more information on how to use the SDK.

Prerequisites
------------

[CocoaPods](https://cocoapods.org/) is a dependency manager for Swift and Objective-C Cocoa projects.
 To install the dependencies this SDK requires, you will need to install the CocoaPods Ruby gem:

```
$ sudo gem install cocoapods
```


Use the SDK with CocoaPods
---------------------------

You can add the Swift SDK as a pod to your project by adding the following to your `Podfile`:

```
$ pod 'IngenicoConnectKit'
```

Afterwards, run the following command:

```
$ pod install
```


Run the SDK locally
------------

To obtain the Swift SDK, first clone the code from GitHub:

```
$ git clone https://github.com/Ingenico-ePayments/connect-sdk-client-swift.git
```

Then run the following command to install the dependencies with CocoaPods:

```
$ pod install
```

Afterwards, you can open and run the Xcode workspace that is now created to test the SDK.
