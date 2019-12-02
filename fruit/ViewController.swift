//
//  ViewController.swift
//  fruit
//
//  Created by D7703_22 on 2019. 12. 2..
//  Copyright © 2019년 ParkSunjae. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate {
    var item:[String:String] = [:]
    var elements:[[String:String]] = []
    var currentElement = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = Bundle.main.url(forResource: "Fruit", withExtension: "XML")
        if path != nil {
            let myparser = XMLParser(contentsOf: path!)
            if XMLParser(contentsOf: path!) != nil {
                myparser?.delegate = self
                if(myparser?.parse())! {
                    print("succuess")
                    print(elements)
                }
                else{
                    print("error")
                }
            }
            else {
                print("error")
            }
        }
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElement = elementName
        print(currentElement)
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        print("data = \(data)")
        if !data.isEmpty {
            item[currentElement] = data
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            elements.append(item)
        }
    }
}
