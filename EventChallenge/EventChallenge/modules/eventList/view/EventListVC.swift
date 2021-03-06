//
//  EventListVC.swift
//  EventChallenge
//
//  Created by Eduardo Herzer on 16/02/21.
//

import UIKit
import Kingfisher

class EventListVC: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewErrorMessage: UIView!
    @IBOutlet weak var lbErrorMessage: UILabel!
    
    private var events = [Event]()
    
    private var presenter: EventListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        presenter = EventListPresenter(view: self, service: EventListService())
        presenter.loadEvents()
    }
    
    @IBAction func btnTryAgainClicked(_ sender: Any) {
        self.activityIndicator.startAnimating()
        presenter.loadEvents()
    }
}

extension EventListVC: EventListViewProtocol {
    func listLoaded(events: [Event]) {
        self.events = events
        self.tableView.reloadData()
        
        self.viewErrorMessage.isHidden = true
        self.activityIndicator.stopAnimating()
    }
    
    func showError(message: String) {
        self.lbErrorMessage.text = message
        self.viewErrorMessage.isHidden = false
        self.activityIndicator.stopAnimating()
    }
}

extension EventListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "EventListCell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        if (cell == nil) {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        }
        
        if let cell = cell as? EventListCell {
            let event = events[indexPath.row]
            
            cell.imgEvent.kf.setImage(with: URL(string: event.image))
            cell.lbTitle.text = event.title
            cell.lbDate.text = Date.from(seconds: event.date).humanFormat()
        }
        
        return cell!
    }
}

extension EventListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]
        
        let eventDetailsVC = EventDetailsVC(event: event)
        eventDetailsVC.modalPresentationStyle = .pageSheet
        self.present(eventDetailsVC, animated: true, completion: nil)
    }
}
