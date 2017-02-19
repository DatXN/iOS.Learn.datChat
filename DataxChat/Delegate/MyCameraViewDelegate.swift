//
//  CameraVCDelegate.swift
//  DataxChat
//
//  Created by Nguyễn Xuân Đạt on 2/18/17.
//  Copyright © 2017 Nguyễn Xuân Đạt. All rights reserved.
//

import Foundation
protocol MyCameraViewDelegate {
    func videoRecordingComplete(videoURL: URL)
    func videoRecordingFailed()
    func snapshotTaken(snapshotData: Data)
    func snapshotFailed()

}
