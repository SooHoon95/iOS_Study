//
//  ViewController.swift
//  TableView
//
//  Created by 최수훈 on 2023/04/18.
//

import UIKit

class ViewController: UIViewController {
    
//    var moviesArray: [Movie] = []
    var movieDataManager: DataManager = DataManager()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tableView의 대리자 를 self (ViewController)로 설정해준다는 뜻.
        tableView.dataSource = self
        tableView.rowHeight = 120   // 셀 하나하나의 높이
        tableView.delegate = self

        movieDataManager.makeMovieData()
//        moviesArray = movieDataManager.getMovieData()
        
    }


}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
//        return moviesArray.count
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieCell else { return UITableViewCell() }
        
//        indexPath.section // 그룹
//        indexPath.row // 행
        
        let array = movieDataManager.getMovieData()
        let movie = array[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.moviewNameLabel.text = movie.movieName
        cell.discriptionLabel.text = movie.movieDescription
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(#function)
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(#function)
        
        
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            detailVC.movieData = array[indexPath.row]  // 우리가 전달하길 원하는 데이터
        }
    }
}
