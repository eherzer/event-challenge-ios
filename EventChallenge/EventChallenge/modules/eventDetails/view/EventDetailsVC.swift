//
//  EventDetailsVC.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import UIKit
import Kingfisher

class EventDetailsVC: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
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
        
        presenter = EventDetailsPresenter(view: self, service: EventDetailsService())
        
        if let event = event {
            eventLoaded(event: event)
        } else if let idEvent = idEvent {
            presenter.loadEvent(id: idEvent)
        }
    }
}

extension EventDetailsVC: EventDetailsViewProtocol {
    func eventLoaded(event: Event) {
        self.event = event
        
        imageView.kf.setImage(with: URL(string: event.image))
        lbTitle.text = event.title
        lbDate.text = Date.from(seconds: event.date).humanFormat()
        lbDescription.text = event.description
        
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
