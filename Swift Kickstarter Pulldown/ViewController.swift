//
//  ViewController.swift
//  Swift Kickstarter Pulldown
//
//  Created by Bill Richards on 7/14/14.
//  Copyright (c) 2014 Bill Richards. All rights reserved.
//

import UIKit

let kHeaderHeight:CGFloat = 200

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
                            
    @IBOutlet var tableView: UITableView
    let imageView: UIImageView = UIImageView(image: UIImage(named: "Brain"))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.clearColor()
        
        self.imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kHeaderHeight)
        self.imageView.contentMode = .ScaleAspectFill
        self.imageView.clipsToBounds = true
        
        let tableHeaderView = UIView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kHeaderHeight));
        tableHeaderView.backgroundColor = UIColor.purpleColor()
        tableHeaderView.addSubview(self.imageView)
        self.tableView.tableHeaderView = tableHeaderView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "Cell")
        cell.textLabel.text = "Item \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        let yPos: CGFloat = -scrollView.contentOffset.y
        
        if (yPos > 0) {
            var imgRect: CGRect = self.imageView.frame
            imgRect.origin.y = scrollView.contentOffset.y
            imgRect.size.height = kHeaderHeight+yPos
            self.imageView.frame = imgRect
        }
    }
}

