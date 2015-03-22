//
//  LetrasViewController.m
//  Navigation
//
//  Created by Luciano Moreira Turrini on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LetrasViewController.h"

@interface LetrasViewController ()

@end

@implementation LetrasViewController

#pragma mark synthesize

@synthesize viewsCopy;
@synthesize lettersInteraction;

@synthesize labelLetra;
@synthesize labelPalavra;
@synthesize imagePalavra;

#pragma mark views

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Singleton
    lettersInteraction = [LettersInteraction sharedInstance];
   
    [self interaction];
    
    [self buttonsNavigationController];
   
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [labelPalavra setHidden:TRUE];
    [labelLetra setHidden:TRUE];
    [imagePalavra setHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [labelPalavra setHidden:NO];
    [labelLetra setHidden:NO];
    [imagePalavra setHidden:NO];
    
}

#pragma mark interactions

// View interactions
-(void)interaction {
    
    // set background color on View
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // set title on navigation
    [self setTitle:[[lettersInteraction letters] objectAtIndex:[lettersInteraction iterator]]];
    
    labelLetra = [[UILabel alloc]initWithFrame: CGRectMake(0, 0, 0, 0)];
    labelPalavra = [[UILabel alloc]initWithFrame: CGRectMake(0, 0, 0, 0)];
    imagePalavra = [[UIImageView alloc]initWithFrame: CGRectMake(0, 0, 0, 0)];
    
    [labelLetra setText:[lettersInteraction.letters objectAtIndex:[lettersInteraction iterator]]];
    [labelLetra setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0]];
    [labelLetra setTextAlignment:NSTextAlignmentCenter];
    
    [labelPalavra setText:[lettersInteraction.words objectAtIndex:[lettersInteraction iterator]]];
    [labelPalavra setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:40.0]];
    [labelPalavra setTextAlignment:NSTextAlignmentCenter];
    
    [imagePalavra setImage:[UIImage imageNamed:[lettersInteraction.images objectAtIndex:[lettersInteraction iterator]]]];
    
    [self.view addSubview:imagePalavra];
    [self animateImages:imagePalavra];
    [self.view addSubview:labelLetra];
    [self animateLetters:labelLetra];
    [self.view addSubview:labelPalavra];
    [self animateWords:labelPalavra];
    
}

// Zoom image on TouchBegan
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:2.0 animations:^{
        CGAffineTransform newTransform;
        newTransform = CGAffineTransformMakeRotation(1.57*3);
        
        imagePalavra.transform = CGAffineTransformScale(newTransform,2,2);
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            
        }];
    }];
    
}


// Return size on TouchEnded
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:2.0 animations:^{
        CGAffineTransform newTransform;
        newTransform = CGAffineTransformMakeRotation(0*1);
        imagePalavra.transform = CGAffineTransformScale(newTransform,1,1);
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            
        }];
    }];
    
}


#pragma mark Buttons-Navigation

-(void)buttonsNavigationController {

    // next
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    // back
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
        
    
}


-(void)next:(id)sender {

    
    LetrasViewController *viewController = [[LetrasViewController alloc]
                                     initWithNibName:nil
                                     bundle:NULL];
    
    viewsCopy = [self.navigationController.viewControllers mutableCopy];
    
    if ( [viewsCopy count] == 3){
        [viewsCopy removeObjectAtIndex:0];
        self.navigationController.viewControllers  = viewsCopy;
    }
    
    [self.navigationController pushViewController:viewController
                                             animated:NO];
    
    // send next interaction letters to the view that will come
    [lettersInteraction next];
}


-(void)back:(id)sender {
    
    LetrasViewController *viewController = [[LetrasViewController alloc]
                                      initWithNibName:nil
                                      bundle:NULL];
    
    [lettersInteraction back];
    
    viewsCopy = [self.navigationController.viewControllers mutableCopy];
    if ([viewsCopy count] == 3) {
        
        [viewsCopy addObject:viewController];
        [viewsCopy removeLastObject];
        self.navigationController.viewControllers = viewsCopy;
        
    } else {
        
        [viewsCopy insertObject:viewController atIndex:0];
        self.navigationController.viewControllers = viewsCopy;
    }
    
    
    [self.navigationController popViewControllerAnimated:NO];
}


#pragma mark Animations

// Animate Letters from UILabel
-(void)animateLetters:(UILabel *)label
{
        [UIView animateWithDuration:0.3
                                    delay:0.1
                                  options:UIViewAnimationOptionCurveEaseIn
                               animations:^(void) {
                                       label.frame = CGRectMake(0,-10,self.view.bounds.size.width,200);
                                   }completion:nil];
    }


// Animate Words from UILabel
-(void)animateWords:(UILabel*)label
{
        [UIView animateWithDuration:0.3
                                    delay:0.1
                                  options:UIViewAnimationOptionCurveEaseIn
                               animations:^(void) {
                                       label.frame = CGRectMake(0,400,self.view.bounds.size.width,50);
                        
                                   }completion:nil];
}


// Animate Images from UIImageView
-(void)animateImages:(UIImageView*)img
{
        [UIView animateWithDuration:0.3
                                    delay:0.1
                                  options:UIViewAnimationOptionCurveEaseIn
                               animations:^(void) {
                                       img.frame = CGRectMake(0, 0, 200, 200);
                                       [img setCenter:self.view.center];
                                   }completion:nil];
}


@end
