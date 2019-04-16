//
//  DayScheduleView.swift
//  mykingapp
//
//  Created by Spencer Creveling on 3/28/19.
//  Copyright © 2019 Ryan Heaton. All rights reserved.
//

import UIKit
import PDFKit
class DayScheduleView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let pdfView = PDFView(frame:UIScreen.main.bounds)
        let url = Bundle.main.url(forResource: "A day", withExtension: "pdf")
        pdfView.document = PDFDocument(url: url!)
        view.addSubview(pdfView)
    }
    

   
}
