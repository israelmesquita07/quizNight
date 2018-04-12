//
//  QuestoesViewController.swift
//  quizNight
//
//  Created by Israel3D on 12/04/2018.
//  Copyright © 2018 Israel3D. All rights reserved.
//

import UIKit

class QuestoesViewController: UIViewController {

    @IBOutlet weak var imgDica: UIImageView!
    @IBOutlet weak var stackBotoes: UIStackView!
    
    var cidades:[String] = ["Curitiba", "Toronto", "New York", "Washington"]
    var opcoes: [String] = ["São Paulo","Vancouver","Paris"]
    var opcaoCerta:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opcoes.append(contentsOf: cidades)
        carregarQuestao()
    }
    
    func carregarQuestao() {
        
        if cidades.count == 0 {
            return
        }
        
        let i = Int(arc4random_uniform(UInt32(cidades.count)))
        let cidade = cidades[i]
        cidades.remove(at: i)
        
        let imageName = cidade.replacingOccurrences(of: " ", with: "").lowercased() + ".jpg"
        imgDica.image = UIImage(named: imageName)
        
        var minhasOpcoes = embaralhar(vetor: opcoes)
        opcaoCerta = 0
        for (indice, opcao) in minhasOpcoes.enumerated() {
            if opcao == cidade {
                opcaoCerta = indice
                break
            }
        }
        
        if opcaoCerta >= 4 {
            //Colocar a opção certa entra as 4 primeiras
            let novaOpcao = Int(arc4random_uniform(UInt32(4)))
            minhasOpcoes.swapAt(opcaoCerta, novaOpcao)
            opcaoCerta = novaOpcao
        }
        
        var opcao = 0
        for view in stackBotoes.subviews {
            if let btn = view as? UIButton {
                btn.setTitle(minhasOpcoes[opcao], for: .normal)
                opcao += 1
            }
        }
        
    }
    
    func embaralhar(vetor:[String]) -> [String] {
        
        if vetor.count < 2 {
            return vetor
        }
        var vetorEmbaralhado = vetor
        
        //embaralhar vetor
        for i in 0..<vetorEmbaralhado.count - 1 {
            let j = Int(arc4random_uniform(UInt32(vetor.endIndex - 1))) + i
            if  i != j {
                //Troca os elementos
                vetorEmbaralhado.swapAt(i, j)
            }
        }
        
        return vetorEmbaralhado
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
