//
//  LettersInteraction.h
//  Navigation
//
//  Created by Luciano Moreira Turrini on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LettersInteraction : NSObject

@property int iterator;
@property NSArray *letters;
@property NSArray *words;
@property NSArray *images;


-(id)init;
+(id)sharedInstance;

-(void)next;
-(void)back;

@end
