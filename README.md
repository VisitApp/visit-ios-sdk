# VisitIOSSdk

[![CI Status](https://img.shields.io/travis/2319795/VisitIOSSdk.svg?style=flat)](https://travis-ci.org/2319795/VisitIOSSdk)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- Supports iOS version >=11.0
- Please ensure that you have added permission texts for the following usages in your Info.plist file - Privacy - Camera Usage Description, Privacy - Local Network Usage Description, Privacy - Microphone Usage Description
- Enable the "Background modes" capability for Audio, Airplay, and Picture in Picture in your Signings and Capabilites tab for your target

## Installation

VisitIOSSdk is available through [Visit private pod spec](https://github.com/VisitApp/visit-ios-pod-spec). To install
it, add the following lines to the top of your Podfile:

```ruby
source 'https://github.com/VisitApp/visit-ios-pod-spec.git'
source 'https://github.com/CocoaPods/Specs.git'
```

Then, add the following line within the target in your Podfile:

```ruby
pod 'VisitIOSSdk'
```

## Usage

To use the SDK, you simply need to add the `VisitAppView` within your view controller or storyboard file. Ensure that your view controller conforms to the `VisitVideoCallDelegate` and set the `videoCallDelegate` property for the view as your view controller.

Once that is done, call the `load` method on the view with the SSO URL that you have generated for the user to render the visit app

Here's an example code where the `VisitAppView` is programmatically initialized -

```swift

import UIKit
import VisitIOSSdk

class ViewController: UIViewController, VisitVideoCallDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Initialize the visit app view
        let visitAppView = VisitAppView.init()
        visitAppView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(visitAppView)
        // Setup the videoCallDelegate property for the view
        visitAppView.videoCallDelegate = self
        // Call the load method with the SSO link
        visitAppView.load(appUrl: "MY_SSO_LINK")
        let views = ["view" : visitAppView]

        // Additional constraints to fit the visit view
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|-[view]-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: views))
    }


}
```

## Author

2319795, aditya.ajeet@gmail.com
