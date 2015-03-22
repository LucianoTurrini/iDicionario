//
//  LettersInteraction.m
//  Navigation
//
//  Created by Luciano Moreira Turrini on 3/16/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "LettersInteraction.h"

@implementation LettersInteraction

@synthesize iterator;
@synthesize letters;
@synthesize words;
@synthesize images;


static LettersInteraction *SINGLETON = nil;

static bool isFirstAccess = YES;

+(id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}


//Init
- (id) init {
    self = [super init];
    
    if (self) {
        letters = [[NSArray alloc] init];
        words = [[NSArray alloc] init];
        images = [[NSArray alloc] init];
        letters = @[@"A", @"B", @"C", @"D", @"E", @"F",
                   @"G", @"H", @"I", @"J", @"K", @"L",
                   @"M", @"N", @"O", @"P", @"Q", @"R",
                   @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
        
        words = @[@"AVIÃO", @"BICICLETA", @"CARRO", @"DADO", @"ELEFANTE", @"FLOR",
                  @"GALINHA", @"HELICÓPTERO", @"IGLU", @"JUJUBA", @"KIKA", @"LEÃO",
                  @"MELANCIA", @"NUVEM", @"ÔNIBUS", @"PEIXE", @"QUADRO", @"RATA",
                  @"SAPO", @"TUBARÃO", @"URSO", @"VACA", @"WAFFER", @"XÍCARA", @"YURI", @"ZEBRA"];
        
        images = @[@"aviao.png", @"bicicleta.png", @"carro.png", @"dado.png", @"elefante.png", @"flor.png",
                   @"galinha.png", @"helicoptero.png", @"iglu.png", @"jujuba.png", @"kika.png", @"leao.png",
                   @"melancia.png", @"nuvem.png", @"onibus.png", @"peixe.png", @"quadro.png", @"rata.png", @"sapo.png",
                   @"tubarao.png", @"urso.png", @"vaca.png", @"waffer.png", @"xicara.png", @"yuri.png", @"zebra.png"];

    }
    return self;
}


-(void)next {
    
    if (iterator == 25)
        iterator = 0;
    else
        iterator++;
    
}

-(void)back {
    if (iterator == 0)
        iterator = 25;
    else
        iterator --;
}





@end
