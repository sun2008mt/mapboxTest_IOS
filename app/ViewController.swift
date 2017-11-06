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
    var mapView: MGLMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //自定义样式
//        let customStyleURL = Bundle.main.url(forResource: "third_party_vector_style", withExtension: "json")


        //构建地图MGLMapView对象
//        let url = URL(string: "mapbox://styles/mapbox/streets-v10")
//        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
          mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.outdoorsStyleURL())
//        mapView = MGLMapView(frame: view.bounds, styleURL: customStyleURL)
//        mapView = MGLMapView(frame: view.bounds)

        //tintColor定义一个非默认的着色颜色值（子控件默认会继承此tintColor）
        mapView.tintColor = .darkGray
//        mapView.tintColor = .white

        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        //设置地图中心和缩放级别并将MGLMapView对象添加到根View下
        mapView.setCenter(CLLocationCoordinate2D(latitude: 45.520486, longitude: -122.673541), zoomLevel: 11 ,animated: false)
        view.addSubview(mapView)

        //将地图对象的代理属性设置为self并且实例化
        mapView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        //地图初始化完成后添加marker和绘制多边形
        addMyMarker()
        drawPolygon()
    }

    //使用默认marker
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }

    //当annotation被点击时允许信息框出现
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }

    func mapView(_ mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat {
        return 0.5
    }

    func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        return .white
    }

    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor(red: 59/255, green: 178/255, blue: 208/255, alpha: 1)
    }

    //添加marker
    func addMyMarker() {
        //声明marker对象并且设置坐标、标题和子标题
        let hello = MGLPointAnnotation()
        hello.coordinate = CLLocationCoordinate2D(latitude: 45.520486, longitude: -122.673541)
        hello.title = "Hello world!"
        hello.subtitle = "Welcome to my marker"

        //将marker添加到地图中
        mapView.addAnnotation(hello)
    }

    //绘制自定义多边形
    func drawPolygon() {
        var coordinates = [
            CLLocationCoordinate2D(latitude: 45.522585, longitude: -122.685699),
            CLLocationCoordinate2D(latitude: 45.534611, longitude: -122.708873),
            CLLocationCoordinate2D(latitude: 45.530883, longitude: -122.678833),
            CLLocationCoordinate2D(latitude: 45.547115, longitude: -122.667503),
            CLLocationCoordinate2D(latitude: 45.530643, longitude: -122.660121),
            CLLocationCoordinate2D(latitude: 45.533529, longitude: -122.636260),
            CLLocationCoordinate2D(latitude: 45.521743, longitude: -122.659091),
            CLLocationCoordinate2D(latitude: 45.510677, longitude: -122.648792),
            CLLocationCoordinate2D(latitude: 45.515008, longitude: -122.664070),
            CLLocationCoordinate2D(latitude: 45.502496, longitude: -122.669048),
            CLLocationCoordinate2D(latitude: 45.515369, longitude: -122.678489),
            CLLocationCoordinate2D(latitude: 45.506346, longitude: -122.702007),
            CLLocationCoordinate2D(latitude: 45.522585, longitude: -122.685699)
        ]

        let shape = MGLPolygon(coordinates: &coordinates, count: UInt(coordinates.count))

        mapView.addAnnotation(shape)
    }
}

