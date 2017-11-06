//
//  ViewController.swift
//  app
//
//  Created by Marc SUN on 11/6/17.
//  Copyright © 2017 Marc SUN. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController, MGLMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //构建地图MGLMapView对象
//        let url = URL(string: "mapbox://styles/mapbox/streets-v10")
//        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        let mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.outdoorsStyleURL())
        
        //tintColor定义一个非默认的着色颜色值（子控件默认会继承此tintColor）
        mapView.tintColor = .darkGray
        
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //设置地图中心和缩放级别并将MGLMapView对象添加到根View下
        mapView.setCenter(CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407), zoomLevel: 13 ,animated: false)
        view.addSubview(mapView)
        
        //将地图对象的代理属性设置为self并且实例化
        mapView.delegate = self
        
        //声明marker对象并且设置坐标、标题和子标题
        let hello = MGLPointAnnotation()
        hello.coordinate = CLLocationCoordinate2D(latitude: 40.7326808, longitude: -73.9843407)
        hello.title = "Hello world!"
        hello.subtitle = "Welcome to my marker"
        
        //将marker添加到地图中
        mapView.addAnnotation(hello)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //使用默认marker
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }
    
    //当annotation被点击时允许信息框出现
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
}

