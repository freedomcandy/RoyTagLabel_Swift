//
//  ViewController.swift
//  RoySwiftTools
//
//  Created by RoyGuo on 15/4/21.
//  Copyright (c) 2015年 RoyGuo. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,RoyTagLabelDelegate {

    var manager:CLLocationManager?;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager? = CLLocationManager();
        manager?.delegate = self;
        manager?.desiredAccuracy = kCLLocationAccuracyBest;
        
        
        
        var screenWidth = UIScreen.mainScreen().bounds.size;
        
        var royTag = RoyTagLabel(frame: CGRectMake(10, 64, screenWidth.width-20, 60));
        royTag.delegate = self;
        
        var tempArray = ["agfdg","b","cdfe","a32423","b","cdgb","ahthy","b43t34t","cfasnhn","agfdg","b","cdfe","a32423","b","cdgb","ahthy","b43t34t","cfasnhn","agfdg","b","cdfe","a32423","b","cdgb","ahthy","b43t34t","cfasnhn","agfdg","b","cdfe","a32423","b","cdgb","ahthy","b43t34t","cfasnhn"];
        
        royTag.setTags(tempArray);
        
        self.view.addSubview(royTag);
        
        royTag.frame = CGRectMake(10, 64, screenWidth.width-20, royTag.totalHeight!);
        
        
        
    }
    
    
    

    
    
    
    override func viewDidAppear(animated: Bool) {
        if CLLocationManager.authorizationStatus() == .NotDetermined{
          
            if CLLocationManager.locationServicesEnabled() {
            }
        }

    }
    
    
    
    @IBAction func royTest(sender: AnyObject) {
          manager?.requestWhenInUseAuthorization();
           manager?.startUpdatingLocation();

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            manager.startUpdatingLocation()
            
        }
    }
    
    
    func tapedTagLabel(labTag: NSInteger, labelText: String, tapedView: UIView) {
        println("tag:\(labTag)  text:\(labelText)");
    }
    

}

