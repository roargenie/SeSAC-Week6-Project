

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardView: CardView!
    
    
    
    
    // 변경되지 않는 UI
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setupUI() {
        cardView.backgroundColor = .clear
        cardView.posterImageView.backgroundColor = .lightGray
        cardView.layer.cornerRadius = 10
        cardView.likeButton.tintColor = .systemPink
        
    }
    
    
    
    
    
}
