

import UIKit
/*
 Xml Interface Builder
 1. UIView Custom Class
 2. File's owner
 - 인터페이스 빌더 UI초기화 구문: required init? (프로토콜 초기화 구문)
 - 코드 UI초기화 구문: override init
 
 */
class CardView: UIView {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let view = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .lightGray
        
        self.addSubview(view)
        
    }
    
//    override init(frame: CGRect) {
//        <#code#>
//    }
    
    
}
