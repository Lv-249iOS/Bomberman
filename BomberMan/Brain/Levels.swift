//
//  Levels.swift
//  BomberMan
//
//  Created by Zhanna Moskaliuk on 9/1/17.
//  Copyright © 2017 Lv-249 iOS. All rights reserved.
//

import Foundation

class Levels {
    
    enum Level: String {
        case one = "WWWWWWWWWWW  0     WW  W W W WW        WW  W BBW WW    B   WW  WBDBW WW    B   WWM WBBMW WWWWWWWWWWW"
        case two = "WWWWWWWWWWWWWWWW MWBW MBBBMWWWW             WW   BUBBB  WW WW  BBBBBBB    WW  BBDBBUB    WW   BBBBB     WW  M BBB      WW     BM   0  WW     BBB     WW            MWWWWWWWWWWWWWWWW"
        
        case three = "WWWWWWWWWWWWWWWW 0          MWW    BBWBB    WW   BBBWBBB   WW   BBBWBDM   WW    BBBBB    WW M    B      WW     BUB     WW      BM     WW  BUB WWWWW BWWM         BWBWWWWWWWWWWWWWWWW"
        
        case four = "WWWWWWWWWWWWWWWW0 BUBBBBBBB  WW WBW W W W W WW BB MBBB BBBBWWBW WBWBWBWBWBWWBBBBBB BB M BWWBWBWBWDWBWBW WWBBM B BBM  BBWWBWBWBW WBWBWBWW BBBBBBB MBBBWW WBWBWBWBWBW WW MBBBBB UBBM WWWWWWWWWWWWWWWW"
        
        case five = "WWWWWWWWWWWWWWWWBB  B  BBB WBWW   UBW WMWBWBWWWWWBWBW  WBW WW  B MBB  BWBWWWB  BDB   W 0 WW             WW   UBB W BWB WW WWWM   WWB  WWW BWMW  BWB MWW  M  B BB    WWWWWWWWWWWWWWWW"
        
        
        case six = "WWWWWWWWWWWWWWWWBB  B BB BBB WWBWMWMW WBWBWBWWBBBB B  BBBBBWWBWBW WBWUWBWBWW  B 0    BB MWW WBW W W W WBWW  M        B WW WBWBW WBW WBWWBBBB U B BMB WW W WBWMW W WBWWBB DBBB B BB WWWWWWWWWWWWWWWW"
        
        case seven = "WWWWWWWWWWWWWWWW   M B B  U 0WW WBW WBWBWBW WWB B   BBBB BBWWBW WBWBWBWBWBWWB B MBBBBM BBWWBWBWDWBW  WBWWW BB BB BBBB  WW WBW W WBW W WW BBM B   B BBWW WBWBW WBW W WW   B  M  BB  WWWWWWWWWWWWWWWW"
        
        case eight = "WWWWWWWWWWWWWWWW    BU BWBB 0WW BWB B B BWB WWMWWW W  WWMW WW BWBWUWBWM B WWW MWW  WW WWWWW BWB BWBWBWBMWWWB BMBMBWB B WW WUW WW   WWWWWMBWB M BDB B WW   W  WW   M WWWWWWWWWWWWWWWW"
        
        case nine = "WWWWWWWWWWWWWWWW   MBUB     WWW WBWWWB WWW  WW WBMW 0  MWW WWMW  M      W WW BW B      W WW WWWWMWWMWWW WWB WMW WBWBWBWWWW   BBB BBBB WWBBUM WDW BBM WWWWBBMWW  B  WWWWWWWWWWWWWWWWW"
        
        
        
    }
    
    let levels = [
        Level.one,
        Level.two,
        Level.three,
        Level.four,
        Level.five,
        Level.six,
        Level.seven,
        Level.eight,
        Level.nine
    ]
    
    func level(with index: Int) -> String {
        if index < levels.count {
            return levels[index].rawValue
        }
        
        return levels[0].rawValue
    }
}

class MultiplayerLevels {
    
    enum MultipLevels: String {
        
        case duel = "WWWWWWWWWWWWW B U B WWWP WBWBW UWWW B U U WWW BWUUUWB WWUB  U  BUWW BWBWBWB WWW U B B WWWU WBWBW PWWW B U B WWWWWWWWWWWWW"
        case battle = "WWWWWWWWWWWWWWWWPB B BUB BPBMWW WBWBWBWBWBW WW B U B B B U WWBWBWBWBWBWBWBWW U BBBUBBB U WWBWBWBWBWBWBWBWW U BBBUBBB U WWBWBWBWBWBWBWBWW U BBBUBBB U WWBWBWBWUWBWBWBWW U B B B U B WW WBWBWBWBWBW WWPB B BUB B BPWWWWWWWWWWWWWWWW"
        
        case mincingmachine = "WWWWWWWWWWWWWWWWWWWWWWWWWWWP  BBB  PWWWWWWWUBUBW  WBWBW  WBBUBWWUBUBB BUBBBUB WBUBBWWBBBUW  WUWUW  WBBBUWWWWWBW   BUB   WUWWWWWP    B WUWUW B    PWW  B B BUBBBUB B B  WW WUWUW W W W WUWUW WW  BUB  BUBUB  BUB  WWBWBWUW  B B  WUWUWBWW  BUB  BUBUB  BUB  WW WUWBW W W W WBWUW WW  B B BUBBBUB B B  WWP    B WUWUW B    PWWWWWBW0  BUB   WBWWWWWBUBBW  WUWUW  WBBUBWWBUBUB BUBBBUB BBUBBWWBBUBW  WBWBW  WBBBUWWWWWWWP  BBB  PWWWWWWWWWWWWWWWWWWWWWWWWWW"
    }
    func getlevel(level: MultipLevels) -> String {
        return level.rawValue
    }
}
/*
 case one = "
 WWWWWWWWWW
 W  0     W
 W  W W W W
 W        W
 W  W BBW W
 W    B   W
 W  WBDBW W
 W    B   W
 WM WBBMW W
 WWWWWWWWWW"
 
 case two = "
 WWWWWWWWWWWWWWW
 W MWBW MBBBMWWW
 W             W
 W   BUBBB  WW W
 W  BBBBBBB    W
 W  BBDBBUB    W
 W   BBBBB     W
 W  M BBB      W
 W     BM   0  W
 W     BBB     W
 W            MW
 WWWWWWWWWWWWWWW"
 
 case three = "
 WWWWWWWWWWWWWWW
 W 0          MW
 W    BBWBB    W
 W   BBBWBBB   W
 W   BBBWBDM   W
 W    BBBBB    W
 W M    B      W
 W     BUB     W
 W      BM     W
 W  BUB WWWWW BW
 WM         BWBW
 WWWWWWWWWWWWWWW"
 
 case four = "
 WWWWWWWWWWWWWWW
 W0 BUBBBBBBB  W
 W WBW W W W W W
 W BB MBBB BBBBW
 WBW WBWBWBWBWBW
 WBBBBBB BB M BW
 WBWBWBWDWBWBW W
 WBBM B BBM  BBW
 WBWBWBW WBWBWBW
 W BBBBBBB MBBBW
 W WBWBWBWBWBW W
 W MBBBBB UBBM W
 WWWWWWWWWWWWWWW"
 
 case five = "
 WWWWWWWWWWWWWWW
 WBB  B  BBB WBW
 W   UBW WMWBWBW
 WWWWBWBW  WBW W
 W  B MBB  BWBWW
 WB  BDB   W 0 W
 W             W
 W   UBB W BWB W
 W WWWM   WWB  W
 WW BWMW  BWB MW
 W  M  B BB    W
 WWWWWWWWWWWWWWW"
 
 case six = "
 WWWWWWWWWWWWWWW
 WBB  B BB BBB W
 WBWMWMW WBWBWBW
 WBBBB B  BBBBBW
 WBWBW WBWUWBWBW
 W  B 0    BB MW
 W WBW W W W WBW
 W  M        B W
 W WBWBW WBW WBW
 WBBBB U B BMB W
 W W WBWMW W WBW
 WBB DBBB B BB W
 WWWWWWWWWWWWWWW"
 
 case seven = "
 WWWWWWWWWWWWWWW
 W   M B B  U 0W
 W WBW WBWBWBW W
 WB B   BBBB BBW
 WBW WBWBWBWBWBW
 WB B MBBBBM BBW
 WBWBWDWBW  WBWW
 W BB BB BBBB  W
 W WBW W WBW W W
 W BBM B   B BBW
 W WBWBW WBW W W
 W   B  M  BB  W
 WWWWWWWWWWWWWWW"
 
 case eight = "
 WWWWWWWWWWWWWWW
 W    BU BWBB 0W
 W BWB B B BWB W
 WMWWW W  WWMW W
 W BWBWUWBWM B W
 WW MWW  WW WWWW
 W BWB BWBWBWBMW
 WWB BMBMBWB B W
 W WUW WW   WWWW
 WMBWB M BDB B W
 W   W  WW   M W
 WWWWWWWWWWWWWWW"
 
 case nine = "
 WWWWWWWWWWWWWWW
 W   MBUB     WW
 W WBWWWB WWW  W
 W WBMW 0  MWW W
 WMW  M      W W
 W BW B      W W
 W WWWWMWWMWWW W
 WB WMW WBWBWBWW
 WW   BBB BBBB W
 WBBUM WDW BBM W
 WWWBBMWW  B  WW
 WWWWWWWWWWWWWWW"
 
 case duel =
 
 WWWWWWWWWWW
 WW B U B WW
 WP WBWBW UW
 WW B U U WW
 W BWUUUWB W
 WUB  U  BUW
 W BWBWBWB W
 WW U B B WW
 WU WBWBW PW
 WW B U B WW
 WWWWWWWWWWW
 
 
 CASE battle =
 WWWWWWWWWWWWWWW
 WPB B BUB BPBMW
 W WBWBWBWBWBW W
 W B U B B B U W
 WBWBWBWBWBWBWBW
 W U BBBUBBB U W
 WBWBWBWBWBWBWBW
 W U BBBUBBB U W
 WBWBWBWBWBWBWBW
 W U BBBUBBB U W
 WBWBWBWUWBWBWBW
 W U B B B U B W
 W WBWBWBWBWBW W
 WPB B BUB B BPW
 WWWWWWWWWWWWWWW"
 
 CASE mincingmachine =
 
 WWWWWWWWWWWWWWWWWWWWW
 WWWWWWP  BBB  PWWWWWW
 WUBUBW  WBWBW  WBBUBW
 WUBUBB BUBBBUB WBUBBW
 WBBBUW  WUWUW  WBBBUW
 WWWWBW   BUB   WUWWWW
 WP    B WUWUW B    PW
 W  B B BUBBBUB B B  W
 W WUWUW W W W WUWUW W
 W  BUB  BUBUB  BUB  W
 WBWBWUW  B B  WUWUWBW
 W  BUB  BUBUB  BUB  W
 W WUWBW W W W WBWUW W
 W  B B BUBBBUB B B  W
 WP    B WUWUW B    PW
 WWWWBW0  BUB   WBWWWW
 WBUBBW  WUWUW  WBBUBW
 WBUBUB BUBBBUB BBUBBW
 WBBUBW  WBWBW  WBBBUW
 WWWWWWP  BBB  PWWWWWW
 WWWWWWWWWWWWWWWWWWWWW
 
 
 */
