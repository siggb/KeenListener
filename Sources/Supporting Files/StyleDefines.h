//
//  StyleDefines.h
//  KeenListener
//
//  Created by Ildar Sibagatov on 15.04.14.
//  Copyright (c) 2014 Sig Inc. All rights reserved.
//

#ifndef StyleDefines_h
#define StyleDefines_h

#define DefaultRegularFontName          @"Helvetica"
#define DefaultLightFontName            @"Helvetica-Light"
#define DefaultBoldFontName             @"Helvetica-Bold"

#define DefaultRegularFont(fsize)       [UIFont fontWithName:(DefaultRegularFontName) size:(fsize)]
#define DefaultLightFont(fsize)         [UIFont fontWithName:(DefaultLightFontName) size:(fsize)]
#define DefaultBoldFont(fsize)          [UIFont fontWithName:(DefaultBoldFontName) size:(fsize)]

#define GrayColor                       RGB(48, 48, 48)
#define BlueColor                       RGB(0, 158, 194)

#endif
