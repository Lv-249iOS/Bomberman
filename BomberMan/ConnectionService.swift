//
//  DataServiceManager.swift
//  BomberMan
//
//  Created by Yevhen Roman on 8/28/17.
//  Copyright © 2017 Lv-249 iOS. All rights reserved.
//

import Foundation
import MultipeerConnectivity

protocol ConnectionServiceManagerDelegate {
    func connectedDevicesChanged(manager: ConnectionServiceManager, connectedDevices: [String])
    func dataReceived(manager: ConnectionServiceManager, playerData: String)
    func connectionLost()
}

protocol InvitationFromUserDelegate {
    func invitationWasReceived(fromPeer: MCPeerID)
}

class ConnectionServiceManager: NSObject {
    // Service type must be a unique string, at most 15 characters long
    // and can contain only ASCII lowercase letters, numbers and hyphens.
    private let playerServiceType = "multi-player"
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    
    var invitationDelegate: InvitationFromUserDelegate?
    var invitationHandler: ((Bool, MCSession?) -> Swift.Void)!

    var serviceAdvertiser : MCNearbyServiceAdvertiser? = nil
    
    var serviceBrowser : MCBrowserViewController! //Take away '!'
    var serviceBrowserDelegate : MCBrowserViewControllerDelegate?
    var delegate: ConnectionServiceManagerDelegate?
        
    lazy var session: MCSession = {
        let session = MCSession(
            peer: self.myPeerId,
            securityIdentity: nil,
            encryptionPreference: .required
        )
        session.delegate = self
        return session
    } ()
    
    
    func startBrowser() {
        serviceBrowser = MCBrowserViewController(serviceType: playerServiceType, session: session)
        serviceBrowser.maximumNumberOfPeers = 2
        serviceBrowserDelegate = serviceBrowser.delegate
    }
    func stopBrowser() {
        serviceBrowser.browser?.stopBrowsingForPeers()
        serviceBrowser.dismiss(animated: true, completion: nil)
    }
    func invitation(accept: Bool) {
        invitationHandler(accept,session)
    }
    func disconnect() {
        session.disconnect()
    }
    func advertiseSelf(_ advertise:Bool) {
        if advertise {
            serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: playerServiceType)
                serviceAdvertiser?.startAdvertisingPeer()
        } else {
            serviceAdvertiser?.stopAdvertisingPeer()
            serviceAdvertiser = nil
        }
    }
    
    
    func sendData(playerData: String) {
        NSLog("%@", "sendPlayer: \(playerData) to \(session.connectedPeers.count) peers")
        
        if session.connectedPeers.count > 0 {
            do {
                try self.session.send(playerData.data(using: .utf8)!, toPeers: session.connectedPeers, with: .reliable)
            }
            catch let error {
                NSLog("%@", "Error for sending: \(error)")
            }
        }
    }
}

///MCSessionDelegate
extension ConnectionServiceManager : MCSessionDelegate {
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        NSLog("%@", "peer \(peerID) didChangeState: \(state)")
        self.delegate?.connectedDevicesChanged(manager: self, connectedDevices:
            session.connectedPeers.map{$0.displayName})
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveData: \(data)")
        let str = String(data: data, encoding: .utf8)!
        self.delegate?.dataReceived(manager: self, playerData: str)
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        NSLog("%@", "didReceiveStream")
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        NSLog("%@", "didStartReceivingResourceWithName")
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        NSLog("%@", "didFinishReceivingResourceWithName")
    }
    
}

extension ConnectionServiceManager : MCNearbyServiceAdvertiserDelegate {
    
    // Incoming invitation request.  Call the invitationHandler block with YES
    // and a valid session to connect the inviting peer to the session.
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Swift.Void) {
        NSLog("%@", "didReceiveInvitationFromPeer \(peerID)")
        self.invitationHandler = invitationHandler
        invitationDelegate?.invitationWasReceived(fromPeer: peerID)
    }
    
    // Advertising did not start due to an error.
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didNotStartAdvertisingPeer error: Error) {
         NSLog("%@", "didNotStartAdvertisingPeer: \(error)")
    }
}
