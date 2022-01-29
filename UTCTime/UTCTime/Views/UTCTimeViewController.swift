//
//  ViewController.swift
//  UTCTime
//
//  Created by 이영재 on 2022/01/29.
//MARK: - View : ViewModel로 부터 가져온 Data를 화면에 나타냄

//MARK: - Frameworks
import UIKit

//MARK: - Types
class UTCTimeViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet var dateTimeLabel: UILabel!
    
    //MARK: - IBActions
    @IBAction func onYesterDay() {
        self.utcTimeViewModel.moveDay(day: -1)
    }
    
    @IBAction func onNow() {
        self.utcTimeViewModel.reload()
    }
    
    @IBAction func onTommorow() {
        self.utcTimeViewModel.moveDay(day: 1)
    }
    
    //MARK: - Properties
    let utcTimeViewModel: UTCTimeViewModel = UTCTimeViewModel()
    
    //MARK: - Methods
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.utcTimeViewModel.onUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.dateTimeLabel.text = self?.utcTimeViewModel.dateTimeString
            }
        }
        self.utcTimeViewModel.reload()
    }
}
