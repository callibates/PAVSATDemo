//
//  String.swift
//  dEmo
//
//  Created by Calli Bates on 14/12/19.
//  Copyright © 2019 Calli Bates. All rights reserved.
//

import Foundation//Library.
extension String//Extensions add new functionality to a class, struct, enum or protocol.
{
    static func randomNumber(length: Int) -> String//Function which increases range of random numbers. Takes in an integer and returns a string.
    {
        var result = ""//Declares a new variable 'result' which is a space character.

        for _ in 0..<length//An underscore stands in for a constant. Until length of random number is no longer greater than 0...
        {
            let digit = Int.random(in: 0...9)//A random number 0 to 9 is saved as 'digit'
            result += "\(digit)"// The digit is added to 'result' and saved as 'result'.
        }

        return result//Result is returned.
    }//END of new static function increasing range of random numbers.
    
    func integer(at n: Int) -> Int//DEFINITION of function, takes in and returns an integer.
    {
        let index = self.index(self.startIndex, offsetBy: n)//Sets index for array?

        return self[index].wholeNumberValue ?? 0//Returns an element of the self array?
    }
}
