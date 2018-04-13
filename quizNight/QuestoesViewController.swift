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
    var pontuacao:Int = 0
    
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
            performSegue(withIdentifier: "fimDeJogo", sender: self)
            return
        }
        
        let i = aleatorio(tamanho: cidades.count)
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
            let novaOpcao = aleatorio(tamanho: 4)
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
        for i in 0..<vetor.count - 1 {
            let j = aleatorio(tamanho: vetor.endIndex - 1) + i
            if  i != j && j < vetor.count {
                //Troca os elementos
                vetorEmbaralhado.swapAt(i, j)
            }
        }
        
        return vetorEmbaralhado
    }
    
    @IBAction func btn1Click(_ sender: UIButton) {
        botao(0)
    }
    @IBAction func btn2Click(_ sender: UIButton) {
        botao(1)
    }
    @IBAction func btn3Click(_ sender: UIButton) {
        botao(2)
    }
    @IBAction func btn4Click(_ sender: UIButton) {
        botao(3)
    }
    
    func botao(_ num:Int) {
        if num == opcaoCerta {
            pontuacao += 1
        }else {
            performSegue(withIdentifier: "fimDeJogo", sender: self)
        }
        carregarQuestao()
    }
    
    //Retorna um numero aleatório a partir de um tamanho informado
    func aleatorio(tamanho: Int) -> Int {
        let sorteio = Int(arc4random_uniform(UInt32(tamanho)))
        return sorteio
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destino = segue.destination as? GameOverViewController {
            destino.pontuacao = self.pontuacao
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
