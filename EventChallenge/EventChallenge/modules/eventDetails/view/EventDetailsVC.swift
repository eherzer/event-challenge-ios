//
//  EventDetailsVC.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import UIKit
import Kingfisher
import MapKit

class EventDetailsVC: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var mapImageView: UIImageView!
    
    private var idEvent: String?
    private var event: Event?
    
    private var presenter: EventDetailsPresenterProtocol!
    
    init(event: Event) {
        self.event = event
        super.init(nibName: nil, bundle: nil)
    }
    
    init(idEvent: String) {
        self.idEvent = idEvent
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(mapClicked)))
        
        presenter = EventDetailsPresenter(view: self, service: EventDetailsService())
        
        if let event = event {
            eventLoaded(event: event)
        } else if let idEvent = idEvent {
            presenter.loadEvent(id: idEvent)
        }
    }
    
    @IBAction func btnShareClicked(_ sender: Any) {
        guard let event = self.event else {
            return
        }
        
        let shareStr = "Vamos ir ao evento \(event.title) no dia \(Date.from(seconds: event.date).humanFormat())!"
        
        let activityVC = UIActivityViewController(activityItems: [shareStr], applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func loadLocationMap() {
        guard  let latitude = self.event?.latitude,
               let longitude = self.event?.longitude else {
            return
        }
        
        let mapSnapshotOptions = MKMapSnapshotter.Options()
        mapSnapshotOptions.mapType = .standard
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 500, longitudinalMeters: 500)
        mapSnapshotOptions.region = region
        mapSnapshotOptions.size = mapImageView.frame.size
        
        let snapShotter = MKMapSnapshotter(options: mapSnapshotOptions)
        snapShotter.start { (snapshot, error) in
            if let snapShotImage = snapshot?.image, let coordinatePoint = snapshot?.point(for: location), let pinImage = UIImage(named: "map_marker_red_24dp") {
                UIGraphicsBeginImageContextWithOptions(snapShotImage.size, true, snapShotImage.scale)
                snapShotImage.draw(at: CGPoint.zero)
                
                let fixedPinPoint = CGPoint(x: coordinatePoint.x - pinImage.size.width / 2, y: coordinatePoint.y - pinImage.size.height)
                pinImage.draw(at: fixedPinPoint)
                let mapImage = UIGraphicsGetImageFromCurrentImageContext()
                
                self.mapImageView.image = mapImage
                UIGraphicsEndImageContext()
            }
        }
    }
    
    @objc private func mapClicked() {
        guard  let latitude = self.event?.latitude,
               let longitude = self.event?.longitude else {
            return
        }
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = self.event?.title
        mapItem.openInMaps(launchOptions: options)
    }
}

extension EventDetailsVC: EventDetailsViewProtocol {
    func eventLoaded(event: Event) {
        self.event = event
        
        imageView.kf.setImage(with: URL(string: event.image))
        lbTitle.text = event.title
        lbDate.text = Date.from(seconds: event.date).humanFormat()
        lbDescription.text = event.description
        
        loadLocationMap()
        
        self.activityIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "Não foi possível carregar o evento", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.dismiss(animated: true)
        }));
        self.present(alertController, animated: true, completion: nil)
    }
}
