//
//  StoreClusterAnnotationView.swift
//  Watsons
//
//  Created by daniele salvioni on 25/02/2019.
//  Copyright © 2019 daniele salvioni. All rights reserved.
//

import UIKit
import MapKit

@available(iOS 11.0, *)
class PhotoClusterAnnotationView: MKAnnotationView
{
    //  MARK: Properties
    internal override var annotation: MKAnnotation? { willSet { newValue.flatMap(configure(with:)) } }
    
    //  MARK: Initialization
    override init(annotation: MKAnnotation?, reuseIdentifier: String?)
    {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        displayPriority = .defaultHigh
        collisionMode = .circle
        centerOffset = CGPoint(x: 0.0, y: -10.0)
        canShowCallout = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) not implemented.")
    }
    
}

//  MARK: Configuration

@available(iOS 11.0, *)
private extension PhotoClusterAnnotationView
{
    func configure(with annotation: MKAnnotation)
    {
        guard let annotation = annotation as? MKClusterAnnotation else { return }
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 40.0, height: 40.0))
        let count = annotation.memberAnnotations.count
        image = renderer.image { _ in
            
            Constants.Color.black1.setFill()
            
            UIBezierPath(ovalIn: CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)).fill()
            let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: Constants.Color.white1,
                                                              NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17) as Any]
            let text = "\(count)"
            let size = text.size(withAttributes: attributes)
            let rect = CGRect(x: 20 - size.width / 2, y: 20 - size.height / 2, width: size.width, height: size.height)
            text.draw(in: rect, withAttributes: attributes)
        }
    }
}
