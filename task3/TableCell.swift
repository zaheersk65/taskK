//
//  TableCell.swift
//  task3
//
//  Created by IMAC on 7/15/19.
//  Copyright © 2019 IMAC. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// This is for media picker code in info.plist

//<key>NSAppleMusicUsageDescription</key>
//<string>Enabled the Media Picker purpose</string>

//This is for getting images from http link innstaed of https in info.plist

//<key>NSAppTransportSecurity</key>
//<dict>
//<key>NSAllowsArbitraryLoads</key>
//<true/>
//<key>NSExceptionDomains</key>
//<dict>
//<key>example.com</key>
//<dict>
//<key>NSExceptionAllowsInsecureHTTPLoads</key>
//<true/>
//<key>NSIncludesSubdomains</key>
//<true/>
//</dict>
//</dict>
//</dict>

//This is for getting map and its functionality in mapkit in info.plist

//<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
//<string>Program requires GPS to track cars and job orders</string>
//<key>NSLocationAlwaysUsageDescription</key>
//<string>Program requires GPS to track cars and job orders</string>
//<key>NSLocationWhenInUseUsageDescription</key>
//<string>Program requires GPS to track cars and job orders</string>
//<key>NSMicrophoneUsageDescription</key>
//<string>This app uses your Microphone to allow Voice over IP communication with the Program Admin system</string>
//<key>UILaunchStoryboardName</key>


//<string>LaunchScreen</string>
//<key>UIMainStoryboardFile</key>
//<string>Main</string>
//<key>UIRequiredDeviceCapabilities</key>
//<array>
//<string>location-services</string>
//<string>armv7</string>
//<string>gps</string>
//</array>
//<key>UISupportedInterfaceOrientations</key>
//<array>
//<string>UIInterfaceOrientationPortrait</string>
//<string>UIInterfaceOrientationLandscapeLeft</string>
//<string>UIInterfaceOrientationLandscapeRight</string>
//</array>
//<key>UISupportedInterfaceOrientations~ipad</key>
//<array>
//<string>UIInterfaceOrientationPortrait</string>
//<string>UIInterfaceOrientationPortraitUpsideDown</string>
//<string>UIInterfaceOrientationLandscapeLeft</string>
//<string>UIInterfaceOrientationLandscapeRight</string>
//</array>
