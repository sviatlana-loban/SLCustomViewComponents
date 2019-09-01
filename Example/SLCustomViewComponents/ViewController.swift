//
//  ViewController.swift
//  SLCustomViewComponents
//
//  Created by sviatlana-loban on 08/21/2019.
//  Copyright (c) 2019 sviatlana-loban. All rights reserved.
//

import UIKit
import SLCustomViewComponents

class ViewController: UIViewController {

    @IBOutlet weak var bb: SLShadowedButton!
    @IBOutlet weak var seg: SLPieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        bb.shadowOffset = CGSize(width: 10, height: 10)
//        bb.shadowColor = UIColor.black
        // Do any additional setup after loading the view, typically from a nib.
        print("\(bb.shadowColor)")
        print("\(bb.shadowOffset)")
//        bb.layer.masksToBounds = false
        //let ss = SLSegment(
        seg.segments = [SLSegment(color: .blue, value: 13.0, title: "xx"),SLSegment(color: .yellow, value: 13.0, title: "xx")]
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("aa")
//        bb.setNeedsLayout()
        //bb.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

