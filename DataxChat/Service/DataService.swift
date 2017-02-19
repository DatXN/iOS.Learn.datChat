//
//  DataService.swift
//  DataxChat
//
//  Created by Nguyễn Xuân Đạt on 2/18/17.
//  Copyright © 2017 Nguyễn Xuân Đạt. All rights reserved.
//

//
//  DataService.swift
//  DevChat
//
//  Created by Mark Price on 7/13/16.
//  Copyright © 2016 Devslopes. All rights reserved.
//

let FIR_CHILD_USERS = "users"

import Foundation
import FirebaseDatabase
import FirebaseStorage

class DataService {
    private static let _instance = DataService()

    static var instance: DataService {
        return _instance
    }

    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }

    var usersRef: FIRDatabaseReference {
        return mainRef.child(FIR_CHILD_USERS)
    }

    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://ios-learn-dataxchat.appspot.com")
    }

    var imagesStorageRef: FIRStorageReference {
        return mainStorageRef.child("images")
    }

    var videoStorageRef: FIRStorageReference {
        return mainStorageRef.child("videos")
    }

    func saveUser(uid: String) {
        let profile: Dictionary<String, AnyObject> = ["firstName": "" as AnyObject, "lastName": "" as AnyObject]
        // auto create child with uid if not exists
        mainRef.child(FIR_CHILD_USERS).child(uid).child("profile").setValue(profile)
    }

    func sendMediaPullRequest(senderUID: String, sendingTo: Dictionary<String, User>, mediaURL: URL, textSnippet: String? = nil) {

        var uids = [String]()
        for uid in sendingTo.keys {
            uids.append(uid)
        }

        let pr: Dictionary<String, AnyObject> = ["mediaURL": mediaURL.absoluteString as AnyObject, "userID": senderUID as AnyObject, "openCount": 0 as AnyObject, "recipients": uids as AnyObject]

        mainRef.child("pullRequests").childByAutoId().setValue(pr)

    }






}

