//
//  VisitVideoCallDelegate.swift
//  VisitIOSSdk
//
//

public protocol VisitVideoCallDelegate : UIViewController {
    
}

public extension VisitVideoCallDelegate {
    func segueToVideoCall(accessToken: String, roomName: String, doctorName: String, doctorProfileImg: String) {
        
        let podBundle = Bundle(for: VideoCallViewController.self)
        let videoCallController = VideoCallViewController.init(nibName: "VideoCallView", bundle: podBundle)
//        podBundle.loadNibNamed("VideoCallView", owner: videoCallController, options: nil)
//        Bundle.main.loadNibNamed("VideoCallView", owner: videoCallController, options: nil)
        
        videoCallController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        videoCallController.modalTransitionStyle = .coverVertical
        self.present(videoCallController, animated: true) {
            videoCallController.connect(accessToken: accessToken, roomName: roomName, doctorName: doctorName, doctorProfileImg: doctorProfileImg)
        }
    }
}
