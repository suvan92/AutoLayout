//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;
@property (nonatomic, weak) UIView *                purpleBoxView;
@property (nonatomic, weak) UIView *                topBlueBox;
@property (nonatomic, weak) UIView *                middleBlueBox;
@property (nonatomic, weak) UIView *                bottomBlueBox;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;
    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    // Set up your views and constraints here
    
    // PURPLE BOX
    UIView *purpleBoxView = [[UIView alloc] initWithFrame:CGRectZero];
    purpleBoxView.backgroundColor = [UIColor purpleColor];
    purpleBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    [framingView addSubview:purpleBoxView];
    
    // create Purple box right margin constraint
    NSLayoutConstraint *purpleBoxRightMargin = [NSLayoutConstraint constraintWithItem:framingView
                                                                            attribute:NSLayoutAttributeRight
                                                                            relatedBy:NSLayoutRelationEqual
                                                                               toItem:purpleBoxView
                                                                            attribute:NSLayoutAttributeRight
                                                                           multiplier:1.0
                                                                             constant:20.0];
    // create Purple box bottom margin constraint
    NSLayoutConstraint *purpleBoxBottomMargin = [NSLayoutConstraint constraintWithItem:framingView
                                                                             attribute:NSLayoutAttributeBottom
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:purpleBoxView
                                                                             attribute:NSLayoutAttributeBottom
                                                                            multiplier:1.0
                                                                              constant:20.0];
    
    // purple box width constraint
    NSLayoutConstraint *purpleBoxWidth = [NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                      attribute:NSLayoutAttributeWidth
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:framingView
                                                                      attribute:NSLayoutAttributeWidth
                                                                     multiplier:(305.0/500.0)
                                                                       constant:1];
    // purple box height constraint
    NSLayoutConstraint *purpleBoxHeight = [NSLayoutConstraint constraintWithItem:purpleBoxView
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:50.0];
    
    [framingView addConstraint:purpleBoxRightMargin];
    [framingView addConstraint:purpleBoxBottomMargin];
    [framingView addConstraint:purpleBoxWidth];
    [purpleBoxView addConstraint:purpleBoxHeight];
    self.purpleBoxView = purpleBoxView;
    
    // CENTER BLUE BOX
    UIView *blueBoxCentre = [[UIView alloc] init];
    blueBoxCentre.backgroundColor = [UIColor blueColor];
    blueBoxCentre.translatesAutoresizingMaskIntoConstraints = NO;
    [framingView addSubview:blueBoxCentre];
    
    // Create blueBoxCentre width constraint
    NSLayoutConstraint *blueBoxWidth = [NSLayoutConstraint constraintWithItem:blueBoxCentre
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:50.0];
    // Create blueBoxCentre height constraint
    NSLayoutConstraint *blueBoxHeight = [NSLayoutConstraint constraintWithItem:blueBoxCentre
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:50.0];
    
    // Create blueBoxCentre centreX constraint
    NSLayoutConstraint *blueBoxCentreX = [NSLayoutConstraint constraintWithItem:framingView
                                                                     attribute:NSLayoutAttributeCenterX
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:blueBoxCentre
                                                                     attribute:NSLayoutAttributeCenterX
                                                                    multiplier:1.0
                                                                      constant:0];
    
    // Create blueBoxCentre centreY constraint
    NSLayoutConstraint *blueBoxCentreY = [NSLayoutConstraint constraintWithItem:framingView
                                                                     attribute:NSLayoutAttributeCenterY
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:blueBoxCentre
                                                                     attribute:NSLayoutAttributeCenterY
                                                                    multiplier:1.0
                                                                      constant:0];
    
    
    [blueBoxCentre addConstraint:blueBoxWidth];
    [blueBoxCentre addConstraint:blueBoxHeight];
    [framingView addConstraint:blueBoxCentreX];
    [framingView addConstraint:blueBoxCentreY];
    
    // TOP BLUE BOX
    UIView *blueBoxTop = [[UIView alloc] init];
    blueBoxTop.backgroundColor = [UIColor blueColor];
    blueBoxTop.translatesAutoresizingMaskIntoConstraints = NO;
    [framingView addSubview:blueBoxTop];
    
    // Create blueBoxTop width constraint
    NSLayoutConstraint *blueBoxTopWidth = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:nil
                                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                                   multiplier:1.0
                                                                     constant:50.0];
    // Create blueBoxTop height constraint
    NSLayoutConstraint *blueBoxTopHeight = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                     attribute:NSLayoutAttributeHeight
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:nil
                                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                                    multiplier:1.0
                                                                      constant:50.0];
    
    // Create blueBoxTop centreX constraint
    NSLayoutConstraint *blueBoxTopCentreX = [NSLayoutConstraint constraintWithItem:framingView
                                                                      attribute:NSLayoutAttributeCenterX
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:blueBoxTop
                                                                      attribute:NSLayoutAttributeCenterX
                                                                     multiplier:1.0
                                                                       constant:0];
    
    // Create blueBoxTop top margin constraint
    NSLayoutConstraint *blueBoxTopMargin = [NSLayoutConstraint constraintWithItem:blueBoxTop
                                                                      attribute:NSLayoutAttributeCenterY
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:framingView
                                                                      attribute:NSLayoutAttributeCenterY
                                                                     multiplier:0.5
                                                                       constant:0];
    
    [blueBoxTop addConstraint:blueBoxTopWidth];
    [blueBoxTop addConstraint:blueBoxTopHeight];
    [framingView addConstraint:blueBoxTopCentreX];
    [framingView addConstraint:blueBoxTopMargin];
    
    // BOTTOM BLUE BOX
    UIView *blueBoxBottom = [[UIView alloc] init];
    blueBoxBottom.backgroundColor = [UIColor blueColor];
    blueBoxBottom.translatesAutoresizingMaskIntoConstraints = NO;
    [framingView addSubview:blueBoxBottom];
    
    // Create blueBoxBottom width constraint
    NSLayoutConstraint *blueBoxBottomWidth = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                       attribute:NSLayoutAttributeWidth
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:50.0];
    
    // Create blueBoxBottom height constraint
    NSLayoutConstraint *blueBoxBottomHeight = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                        attribute:NSLayoutAttributeHeight
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:50.0];
    
    // Create blueBoxBottom centreX constraint
    NSLayoutConstraint *blueBoxBottomCentreX = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:blueBoxBottom
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.0
                                                                          constant:0];
    
    // Create blueBoxBottom centreY constraint
    NSLayoutConstraint *blueBoxBottomMargin = [NSLayoutConstraint constraintWithItem:blueBoxBottom
                                                                        attribute:NSLayoutAttributeCenterY
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:framingView
                                                                        attribute:NSLayoutAttributeCenterY
                                                                       multiplier:1.5
                                                                         constant:0];
    
    [blueBoxBottom addConstraint:blueBoxBottomWidth];
    [blueBoxBottom addConstraint:blueBoxBottomHeight];
    [framingView addConstraint:blueBoxBottomCentreX];
    [framingView addConstraint:blueBoxBottomMargin];
    
    // RED BOX
    UIView *redBox = [[UIView alloc] init];
    redBox.backgroundColor = [UIColor redColor];
    redBox.translatesAutoresizingMaskIntoConstraints = NO;
    [framingView addSubview:redBox];
    
    NSLayoutConstraint *redBoxHeight = [NSLayoutConstraint constraintWithItem:redBox
                                                                       attribute:NSLayoutAttributeHeight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:nil
                                                                       attribute:NSLayoutAttributeNotAnAttribute
                                                                      multiplier:1.0
                                                                        constant:50.0];
    
    NSLayoutConstraint *redBoxWidth = [NSLayoutConstraint constraintWithItem:redBox
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:150.0];
    
    NSLayoutConstraint *redBoxTopMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                       attribute:NSLayoutAttributeTop
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:framingView
                                                                       attribute:NSLayoutAttributeTop
                                                                      multiplier:1.0
                                                                        constant:20.0];
    
    NSLayoutConstraint *redBoxRightMargin = [NSLayoutConstraint constraintWithItem:framingView
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:redBox
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:20.0];
    
    
    [framingView addConstraint:redBoxTopMargin];
    [framingView addConstraint:redBoxRightMargin];
    [redBox addConstraint:redBoxHeight];
    [redBox addConstraint:redBoxWidth];
    
    // WIDE ORANGE BOX
    
    UIView *orangeBoxWide = [[UIView alloc] init];
    orangeBoxWide.backgroundColor = [UIColor orangeColor];
    orangeBoxWide.translatesAutoresizingMaskIntoConstraints = NO;
    [redBox addSubview:orangeBoxWide];
    
    NSLayoutConstraint *orangeBoxWideHeight = [NSLayoutConstraint constraintWithItem:orangeBoxWide
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:30.0];
    
    NSLayoutConstraint *orangeBoxWideWidth = [NSLayoutConstraint constraintWithItem:orangeBoxWide
                                                                   attribute:NSLayoutAttributeWidth
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1.0
                                                                    constant:70.0];
    
    NSLayoutConstraint *orangeBoxWideTopMargin = [NSLayoutConstraint constraintWithItem:orangeBoxWide
                                                                           attribute:NSLayoutAttributeTop
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:redBox
                                                                           attribute:NSLayoutAttributeTop
                                                                          multiplier:1.0
                                                                            constant:10.0];

    NSLayoutConstraint *orangeBoxWideLeftMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                              attribute:NSLayoutAttributeLeft
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:orangeBoxWide
                                                                              attribute:NSLayoutAttributeLeft
                                                                             multiplier:1.0
                                                                               constant:-10.0];
    
    [orangeBoxWide addConstraint:orangeBoxWideWidth];
    [orangeBoxWide addConstraint:orangeBoxWideHeight];
    [redBox addConstraint:orangeBoxWideTopMargin];
    [redBox addConstraint:orangeBoxWideLeftMargin];
    
    // SMALL ORANGE BOX
    
    UIView *orangeBoxSmall = [[UIView alloc] init];
    orangeBoxSmall.backgroundColor = [UIColor orangeColor];
    orangeBoxSmall.translatesAutoresizingMaskIntoConstraints = NO;
    [redBox addSubview:orangeBoxSmall];
    
    NSLayoutConstraint *orangeBoxSmallHeight = [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:30.0];
    
    NSLayoutConstraint *orangeBoxSmallWidth = [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:50.0];

    NSLayoutConstraint *orangeBoxSmallTopMargin = [NSLayoutConstraint constraintWithItem:orangeBoxSmall
                                                                              attribute:NSLayoutAttributeTop
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:redBox
                                                                              attribute:NSLayoutAttributeTop
                                                                             multiplier:1.0
                                                                               constant:10.0];

    NSLayoutConstraint *orangeBoxSmallRightMargin = [NSLayoutConstraint constraintWithItem:redBox
                                                                                 attribute:NSLayoutAttributeRight
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:orangeBoxSmall
                                                                                 attribute:NSLayoutAttributeRight
                                                                                multiplier:1.0
                                                                                  constant:10.0];

    [orangeBoxSmall addConstraint:orangeBoxSmallWidth];
    [orangeBoxSmall addConstraint:orangeBoxSmallHeight];
    [redBox addConstraint:orangeBoxSmallTopMargin];
    [redBox addConstraint:orangeBoxSmallRightMargin];
    
}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:1.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
