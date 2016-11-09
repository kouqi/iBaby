/**
 * @file PeerInfo.h
 * @brief PeerInfo describes information about contacts.
 * <p>PeerInfo describes the phone numbers, names or URIs of contacts.
 */
#ifndef _PEER_INFO_H_
#define _PEER_INFO_H_

#import <Foundation/Foundation.h>

/** 
 * <b>Description:</b> PeerInfo describes information about a contact.
 * <br><b>Purpose:</b> PeerInfo describes the phone numbers, names or uniform resource identifier (URI) of a contact.
 * The UI instantiates this class and invokes the methods or properties in this class to set or obtain the number, name and URI of a contact.
 */
@interface PeerInfo : NSObject
{
@private
    /** the display name of the contact */
    NSString* _name;
    
    /** the number of the contact */
    NSString* _number;
    
    /** the URI of the contact */
    NSString* _uri;
}

/**
 * <b>Description:</b> It is used to get or set a contact name.
 * <br><b>Purpose:</b> 1. When receiving a call or a message, the UI invokes {@link CallSession.peer} to obtain the detailed PeerInfo and 
 * then obtains the incoming number through {@link PeerInfo.number}. If the UI finds corresponding nickname of the obtained phone number 
 * in the contact list , it can set the name in PeerInfo through this property for future use.
 * <br> 2. When initiating a call or sending a message, if the UI already knows the peer name that maps to the peer number, it can set 
 * the peer name in PeerInfo through this property for future use.
 * <br> 3.When initiating a call or sending a message, if the UI has instantiated a PeerInfo, it can obtains the peer name 
 * in the PeerInfo object through this property.
 * <br>The property indicates the name of a contact
 */
@property(nonatomic,retain) NSString* name;

/** 
 * <b>Description:</b> It is used to get or set the phone number.
 * <br><b>Purpose:</b> 1. When receiving a call or a message, the UI invokes {@link CallSession.peer} to obtain the detailed PeerInfo and then 
 * obtains the peer number through this property.
 * <br> 2. The UI can invoke this method when viewing call records. The UI invokes {@link ContactCallLog.peerInfo} or {@link CallLog.peerInfo}
 * to obtain detailed PeerInfo and then obtains the peer number through this property.
 * <br> 3. When initiating a call or sending a message, if the UI has instantiated a PeerInfo, it can invoke this method to 
 * obtain the peer number set by the UI.
 * <br>The property indicates the phone number of a contact
 */
@property(nonatomic,retain) NSString* number;

/**
 * <b>Description:</b> It is used to get or set the URI of a contact.
 * <br><b>Purpose:</b> 1. When initiating a call or sending a message, if the UI already knows the peer URI that maps to the peer number, 
 * it can set the peer URI in PeerInfo through this property for future use.
 * <br> 2. When initiating a call or sending a message, if the UI has instantiated a PeerInfo, it can obtain the peer URI 
 * in the PeerInfo object through this property.
 * <br>The property indicates the URI of a contact
 */
@property(nonatomic,retain) NSString* uri;

@end
#endif