//
//  CodeUtil.swift
//  AIATest
//
//  Created by Laelnaldi Saputra on 22/05/20.
//  Copyright © 2020 AIA. All rights reserved.
//

import Foundation

class CodeUtil {
    public static func generateRandomCode() -> String {
        let numbers = "0123456789"
        let aphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let codeLength = 5
        
        var code = ""
        
        for i in 0..<codeLength {
            if i == 0 || i == 1 {
                code += aphabets.randomElement()?.description ?? ""
            }
            else{
                code += numbers.randomElement()?.description ?? ""
            }
        }
        
        return code
    }
}
