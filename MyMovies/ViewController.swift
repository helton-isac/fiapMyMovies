//
//  ViewController.swift
//  MyMovies
//
//  Created by Helton Isac Torres Galindo on 11/04/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var movie: Movie?
    
    var trailer = ""
    
    @IBOutlet weak var ivMovie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var tvSummary: UITextView!
    
    var datePicker = UIDatePicker()
    
    var alert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let title = movie?.title {
            loadTrailers(title: title)
        }
        
        datePicker.minimumDate = Date()
        
        datePicker.addTarget(self, action: #selector(changeDate), for: .valueChanged)
    }
    
    @objc func changeDate() {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateFormat = "dd/MM/yyyy HH:mm'h"
        
        alert.textFields?.first?.text = dateformatter.string(from: datePicker.date)
    }
    
    func loadTrailers(title: String) {
        
        API.loadTrailers(title: title) { (apiResult) in
            guard
                let results = apiResult?.results,
                let trailer = results.first else {
                    return
                    
            }
            
            DispatchQueue.main.async {
                self.trailer = trailer.previewUrl
                print("URL do Trailer:", trailer.previewUrl)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        
        if let movie = movie {
            ivMovie.image = movie.image as? UIImage
            lbTitle.text = movie.title
            lbCategories.text = movie.categories
            lbDuration.text = movie.duration
            lbRating.text = "⭐️ \(movie.rating) / 10"
            tvSummary.text = movie.summary
        }
    }
    
    @IBAction func scheduleNotification(_ sender: UIButton) {
        
        alert = UIAlertController(title: "Lembrete", message: "Quando deseja ser lembrado de assistir o filme?", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Data do lembrete"
            self.datePicker.date = Date()
            textField.inputView = self.datePicker
        }
        
        let okAction = UIAlertAction(title: "Agendar", style: .default) { (action) in
            self.schedule()
        }
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    

    func schedule() {
        let content = UNMutableNotificationContent()
        let movieTitle = movie?.title ?? ""
        
        content.title = "Lembrete"
        content.body = "Assistir filme \(movieTitle)"
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: "Lembrete", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddEditViewController {
            vc.movie = movie
        }
    }
}
