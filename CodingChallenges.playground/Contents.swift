import UIKit
import Foundation

func challenge1(input: String) -> Bool {
    return Set(input).count == input.count
}

challenge1(input: "No duplicates")
challenge1(input: "abcdefghijklmnopqrstuvwxyz")
challenge1(input: "AaBbCc")
challenge1(input: "Hello, world")

func challenge2(input: String) -> Bool {
    return String(input.lowercased().reversed()) == input.lowercased()
}

challenge2(input: "rotator")
challenge2(input: "Rats live on no evil star")
challenge2(input: "Never odd or even")
challenge2(input: "Hello, world")

func challenge3(input1: String, input2: String) -> Bool {
    return input1.sorted() == input2.sorted()
}

challenge3(input1: "abca", input2: "abca")
challenge3(input1: "abc", input2: "abc")
challenge3(input1: "a1 b2", input2: "b1 a2")
challenge3(input1: "abc", input2: "abca")
challenge3(input1: "abc", input2: "Abc")
challenge3(input1: "abc", input2: "cbAa")

extension String {
    func myContains(_ str: String) -> Bool {
        return range(of: str, options: .caseInsensitive) != nil
    }
}

"Hello, world".myContains("Hello")
"Hello, world".myContains("WORLD")
"Hello, world".myContains("Goodbye")

func challenge5(input: String, char: Character) -> Int {
    
    return input.reduce(0) {
        $1 == char ? $0 + 1 : $0
    }
}

challenge5(input: "The rain in Spain", char: "a")
challenge5(input: "Mississippi", char: "i")
challenge5(input: "Hacking with Swift", char: "i")

func challenge6(input: String) -> String {
    var used = [Character]()
    
    for i in input {
        if !used.contains(i) {
            used.append(i)
        }
    }
    return String(used)
}
challenge6(input: "wombat")
challenge6(input: "hello")
challenge6(input: "Mississippi")

func challenge7(input: String) -> String {
    return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
}

challenge7(input: "a   b   c")
challenge7(input: "     a")
challenge7(input: "abc")

func challenge8(input1: String, input2: String) -> Bool {
    guard input2.count >= input1.count else { return false }
    let doublingInputOne = input1 + input1
    return doublingInputOne.contains(input2)
}

challenge8(input1: "abcde", input2: "eabcd")
challenge8(input1: "abcde", input2: "cdeab")
challenge8(input1: "abcde", input2: "abced")
challenge8(input1: "abc", input2: "a")

func challenge9(input: String) -> Bool {
    let set = Set(input.lowercased())
    let letters = set.filter { $0 >= "a" && $0 <= "z" }
    return letters.count == 26
}
challenge9(input: "The quick brown fox jumps over the lazy dog")
challenge9(input: "The quick brown fox jumped over the lazy dog")

func challenge10(input: String) -> (vowels: Int, consonants: Int) {
    let lowercased = input.lowercased()
    let vowels = CharacterSet(charactersIn: "aeiou")
    let consonants = CharacterSet(charactersIn: "bcdfghjklmnpqrstvwxyz")
    
    var vowelsCount = 0
    var consonantCount = 0
    
    for i in lowercased {
        let stringLetter = String(i)
        if stringLetter.rangeOfCharacter(from: vowels) != nil {
            vowelsCount += 1
        } else if stringLetter.rangeOfCharacter(from: consonants) != nil {
            consonantCount += 1
        }
    }
    
    return (vowelsCount, consonantCount)
}

challenge10(input: "Swift Coding Challenges")
challenge10(input: "Mississippi")

func challenge11(input1: String, input2: String) -> Bool {
    guard input1.count == input2.count else { return false }
    
    var counter = 0
    
    let arr1 = Array(input1)
    let arr2 = Array(input2)
    
    for (index, letter) in arr1.enumerated() {
        if letter != arr2[index] {
            counter += 1
        }
        if counter == 4 {
            return false
        }
    }
    
    return true
}

challenge11(input1: "Clamp", input2: "Cramp")
challenge11(input1: "Clamp", input2: "Crams")
challenge11(input1: "Clamp", input2: "Grams")
challenge11(input1: "Clamp", input2: "Grans")
challenge11(input1: "Clamp", input2: "Clam")
challenge11(input1: "clamp", input2: "maple")

func challenge12(input: String) -> String {
    let words = input.components(separatedBy: " ")
    var currentPrefix = ""
    var bestPrefix = ""
    
    for (index, word) in words.enumerated() {
        for letter in word {
            currentPrefix.append(letter)
            if words[index + 1].hasPrefix(currentPrefix) {
                bestPrefix = currentPrefix
            }
        }
    }
    return bestPrefix
}


func challenge13(input: String) -> String {
    var currentString = ""
    var currentCount = 0
    var returnString = ""
    
    for i in input {
        if String(i) != currentString {
            if !currentString.isEmpty {
                returnString.append(currentString)
                returnString.append("\(currentCount)")
            }
            currentCount = 1
            currentString = String(i)
        } else if String(i) == currentString {
            currentCount += 1
        }
    }
    returnString.append(currentString)
    returnString.append("\(currentCount)")
    
    return returnString
}

challenge13(input: "aabbcc")
challenge13(input: "aaabaaabaaa")
challenge13(input: "aaAAaa")

func challenge15(input: String) -> String {
    let arr = input.components(separatedBy: " ")
    let reversed = arr.map { String($0.reversed()) }
    return reversed.joined(separator: " ")
}

challenge15(input: "Swift Coding Challenges")
challenge15(input: "The quick brown fox")

let qualquercoisa = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let oi = qualquercoisa.filter { $0 % 2 == 0 }
print(oi)
let filtering = qualquercoisa.reduce(0) { $0 + $1 }
print(filtering)


func challenge16() {
    for i in 1...100 {
        if i % 3 == 0 && i % 5 == 0 {
            print("Fizz Buzz")
        } else if i % 3 == 0 {
            print("Fizz")
        } else if i % 5 == 0 {
            print("Buzz")
        } else {
            print(i)
        }
    }
}

//challenge16()

func challenge16b() {
    (1...100).forEach {
        print($0 % 3 == 0 ? $0 % 5 == 0 ? "Fizz Buzz" : "Fizz" : $0 % 5 == 0 ? "Buzz" : "\($0)") }
}


func challenge17(min: Int, max: Int) -> Int {
    return (min...max).randomElement()!
}

challenge17(min: 1, max: 5)
challenge17(min: 8, max: 10)
challenge17(min: 12, max: 12)
challenge17(min: 12, max: 18)

func challenge18(input1: Int, input2: Int) -> Int {
    guard input1 > 0, input2 > 0 else { return 0 }
    
    var returnValue = 1
    for _ in 1...input2 {
        returnValue = returnValue * input1
    }
    return returnValue
}

challenge18(input1: 4, input2: 3)
challenge18(input1: 2, input2: 8)

func challenge24(input: String) -> Int {
    var arrOfInts: [Int] = []
    
    var tempInt = ""
    
    input.forEach {
        if let _ = Int(String($0)) {
            tempInt.append($0)
        } else {
            if !tempInt.isEmpty {
                if let myInt = Int(tempInt) {
                    arrOfInts.append(myInt)
                    tempInt = ""
                }
            }
        }
    }
    
    if !tempInt.isEmpty {
        if let myInt = Int(tempInt) {
            arrOfInts.append(myInt)
            tempInt = ""
        }
    }
    
    return arrOfInts.reduce(0) { $0 + $1 }
}

challenge24(input: "a1b2c3")
challenge24(input: "a10b20c30")
challenge24(input: "h8ers")

func challenge25(input: Int) -> Int {
    guard input != 1 else { return 1}
    
    for i in 0...input / 2 + 1 {
        if i * i > input {
            return i - 1
        }
    }
    return  0
}

challenge25(input: 9)
challenge25(input: 16777216)
challenge25(input: 16)
challenge25(input: 15)

func challegen26(subtract: Int, from: Int) -> Int {
    //return from + -(subtract)
    return from + (~subtract + 1)
}

challegen26(subtract: 5, from: 9)
challegen26(subtract: 10, from: 30)

func challenge27(input: String, myLines: Int) {
    guard let inn = try? String(contentsOfFile: input) else { return }
    
    var lines = inn.components(separatedBy: "\n")
    guard lines.count > 0 else { return }
    
    lines.reverse()
    
    var output = [String]()
    
    for i in 0..<min(lines.count, myLines) {
        output.append(lines[i])
    }
    print(output.joined(separator: ", "))
}

let innn = """
Antony And Cleopatra
Coriolanus
Cymbeline
Hamlet
Julius Caesar
King Lear
Macbeth
Othello
Twelfth Night
"""

challenge27(input: innn, myLines: 3)

func challenge28(filePath: String, message: String) {
    var existingLog = (try? String(contentsOfFile: filePath)) ?? ""
    
    existingLog.append("\(Date()): \(message)\n")
    
    do {
        try existingLog.write(toFile: filePath, atomically: true, encoding: .utf8)
    } catch {
        print(error.localizedDescription)
    }
}

func challenge29() -> URL {
    let oi = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    print(oi)
    return oi[0]
}

challenge29()

func challenge30(path: String) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: path)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    
    var jpegs = [String]()
    
    for file in files {
        if file.pathExtension == "jpg" || file.pathExtension == "jpeg" {
            guard let attributes = try? fm.attributesOfItem(atPath: file.path) else { continue }
            guard let creationDate = attributes[.creationDate] as? Date else { continue }
            
            if creationDate > Date(timeIntervalSinceNow: -60 * 60 * 48) {
                jpegs.append(file.lastPathComponent)
            }
        }
    }
    return jpegs
}

//challenge30(path: "/Users/maczepp/Desktop/mmm")

func challenge31(source: String, destination: String) -> Bool {
    let fm = FileManager.default
    var isDirectory: ObjCBool = false
    
    guard fm.fileExists(atPath: source, isDirectory: &isDirectory) || isDirectory.boolValue == false else { return false }
    
    let sourceURL = URL(fileURLWithPath: source)
    let destinationURL = URL(fileURLWithPath: destination)
    
    do {
        try fm.copyItem(at: sourceURL, to: destinationURL)
    } catch {
        print("Copy failed: \(error.localizedDescription)")
        return false
    }
    return true
}

func challenge32(filename: String, count: String) -> Int {
    guard let inputString = try? String(contentsOfFile: filename) else { return 0 }
    var nonletters = CharacterSet.letters.inverted
    nonletters.remove("'")
    
    let allwords = inputString.components(separatedBy: nonletters)
    let wordsSet = NSCountedSet(array: allwords)
    
    return wordsSet.count(for: count)
}

func challenge33(directory: String) -> [String] {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    
    guard let files = fm.enumerator(at: directoryURL, includingPropertiesForKeys: nil) else { return [] }
    var duplicates = Set<String>()
    var seen = Set<String>()
    
    for case let file as URL in files {
        guard file.hasDirectoryPath == false else { continue }
        let filename = file.lastPathComponent
        
        if seen.contains(filename) {
            duplicates.insert(filename)
        }
        
        seen.insert(filename)
    }
    return Array(duplicates)
}

func challenge34(directory: String) -> [String] {
    let fm = FileManager.default
    let url = URL(fileURLWithPath: directory)
    
    guard let files = try? fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil) else { return [] }
    
    var returnValue = [String]()
    
    for file in files {
        guard file.hasDirectoryPath == false else { continue }
        
        if fm.isExecutableFile(atPath: file.path) {
            returnValue.append(file.lastPathComponent)
        }
    }
    
    return returnValue
}

func challenge35iOS(in directory: String) {
    let fm = FileManager.default
    let directoryURL = URL(fileURLWithPath: directory)
    guard let files = try? fm.contentsOfDirectory(at: directoryURL, includingPropertiesForKeys: nil) else { return }
    
    for file in files {
        guard file.pathExtension == "jpeg" || file.pathExtension == "jpg" else { continue }
        guard let image = UIImage(contentsOfFile: file.path) else { continue }
        guard let png = image.pngData() else { continue }
        
        let newFileName = file.deletingPathExtension().appendingPathExtension("png")
        _ = try? png.write(to: newFileName)
    }
}

extension Collection where Iterator.Element == Int {
    func challenge37(count: Character) -> Int {
        return self.reduce(0) {
            $0 + String($1).filter { (char: Character) -> Bool in
                char == count
            }.count
        }
    }
}

extension Collection where Iterator.Element: Comparable {
    func challenge38(count: Int) -> [Iterator.Element] {
        let sorted = self.sorted()
        return Array(sorted.prefix(count))
    }
}

[1, 2, 3, 4].challenge38(count: 3)

extension Collection where Iterator.Element == String {
    func challenge39() -> [String] {
        return self.sorted { $0.count > $1.count }
    }
}

["a", "abc", "ab"].challenge39()
["paul", "taylor", "adele"].challenge39()


func challenge40(data: [Int]) -> [Int] {
    return Array(Set(data).symmetricDifference(Set(1...100))).sorted()
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)
challenge40(data: testArray)
