//
//  PostTableViewCell.swift
//  testProject
//
//  Created by Developer on 13.03.2022.
//

import UIKit
protocol modifyEventCell{
    func modify()
}
class PostTableViewCell: UITableViewCell {
    var delegate : modifyEventCell? = nil
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var preview_text: UILabel!
    @IBOutlet weak var likesCount: UILabel!
    @IBOutlet weak var timeshamp: UILabel!
    @IBOutlet weak var showDetailOutlet: UIButton!
    @IBAction func showAllTextAction(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var post : Post? = nil
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setData(post:Post){
        self.post = post
        title.text = post.title ?? ""
        preview_text.text = post.preview_text ?? ""
        likesCount.text = "🖤 \(post.likes_count ?? 0)"
        timeshamp.text = dateDiff(time: post.timeshamp ?? 0)
    }
    private func dateDiff(time:Int)->String{
        var date = Date(timeIntervalSince1970: TimeInterval(time))
        var dateNow = Date()
        let dateDiffYears = Calendar.current.dateComponents([.year], from: date, to: dateNow).year
        var dateAgo = ""
        if let year = dateDiffYears{
            dateAgo.append(contentsOf: "\(year) года ")
        }
        dateAgo.append(contentsOf: "назад")
        return dateAgo
    }
}
