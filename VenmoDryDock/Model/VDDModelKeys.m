// VDDModelKeys.m
//
// Copyright (c) 2014 Venmo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "VDDModelKeys.h"

NSString * const VDDModelApp = @"VDDModelApp";
NSString * const VDDAppKeyName = @"name";
NSString * const VDDAppKeyDescription = @"description";
NSString * const VDDAppKeyDetails = @"details";
NSString * const VDDAppKeyImage = @"image";
NSString * const VDDAppKeyInstallUrl = @"install_url";
NSString * const VDDAppKeyShareUrl = @"share_url";
NSString * const VDDAppKeyVersionNumber = @"version_number";
NSString * const VDDAppKeySharable = @"sharable";
NSString * const VDDAppKeyType = @"type";
NSString * const VDDAppKeyRank = @"rank";

NSString * const VDDModelUser = @"VDDModelUser";
NSString * const VDDUserKeyAdvertisingID = @"advertising_id";
NSString * const VDDUserKeyPushToken = @"push_token";

void createDemoObject() {
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"VenmoIcon"], 1.0);
    PFFile *file = [PFFile fileWithName:@"image.png" data:imageData];

    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!succeeded) {
            NSLog(@"Could not save demo object: %@", [error localizedDescription]);
        }
        PFObject *testObject = [PFObject objectWithClassName:VDDModelApp];
        testObject[VDDAppKeyName]           = @"Venmo";
        testObject[VDDAppKeyDescription]    = @"Venmo Dogfood Builds";
        testObject[VDDAppKeyDetails]        = @"Connect with people, send money for free, and cash out to any bank overnight.";
        testObject[VDDAppKeyType]           = @(1);
        testObject[VDDAppKeyVersionNumber]  = @"1";
        testObject[VDDAppKeyRank]           = @(1);
        testObject[VDDAppKeySharable]       = @(YES);

        testObject[VDDAppKeyShareUrl]       = @"http://someshareurl/";
        testObject[VDDAppKeyInstallUrl]     = @"itms-service://someinstallurl/";

        testObject[VDDAppKeyImage]          = file;
        [testObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"Created Demo Object");
            }
            else {
                NSLog(@"Could not save Demo Object: %@", [error localizedDescription]);
            }
        }];
    } progressBlock:^(int percentDone) {

    }];
}
