//
//  LetrasViewController.h
//  Navigation
//
//  Created by Luciano Moreira Turrini on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LettersInteraction.h"

@interface LetrasViewController : UIViewController

@property BOOL PASS;
@property LettersInteraction *lettersInteraction;
@property NSMutableArray *viewsCopy;

// labels
@property UILabel *labelLetra;
@property UILabel *labelPalavra;
@property UIImageView *imagePalavra;

@end
