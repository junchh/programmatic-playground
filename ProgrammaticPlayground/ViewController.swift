//
//  ViewController.swift
//  ProgrammaticPlayground
//
//  Created by Junho Choi on 19/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    private let exampleView: UIView = {
        let vi = UIView()
        vi.backgroundColor = .systemMint
        return vi
    }()
    
    private let stView: UIStackView = {
        let stView = UIStackView()
        stView.axis = .vertical
        stView.distribution = .equalSpacing
        stView.alignment = .fill
        stView.spacing = 20.0
        return stView
    }()
    
    private let view1: UIView = {
        let vi = UIView()
        vi.backgroundColor = .magenta
        return vi
    }()
    
    private let view2: UIView = {
        let vi = UIView()
        vi.backgroundColor = .purple
        return vi
    }()
    
    private let view3: UIView = {
        let vi = UIView()
        vi.backgroundColor = .orange
        return vi
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Next", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        self.view.backgroundColor = .lightGray
        
        self.view.addSubview(exampleView)
        exampleView.addSubview(stView)
        
        exampleView.translatesAutoresizingMaskIntoConstraints = false
        stView.translatesAutoresizingMaskIntoConstraints = false
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        view3.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        stView.addArrangedSubview(view1)
        stView.addArrangedSubview(view2)
        stView.addArrangedSubview(view3)
        
        view3.addSubview(button)
        
        NSLayoutConstraint.activate([
            exampleView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            exampleView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            exampleView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            exampleView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            
            stView.leadingAnchor.constraint(equalTo: exampleView.leadingAnchor),
            stView.trailingAnchor.constraint(equalTo: exampleView.trailingAnchor),
            stView.centerYAnchor.constraint(equalTo: exampleView.centerYAnchor),
            view1.heightAnchor.constraint(equalToConstant: 10),
            view2.heightAnchor.constraint(equalToConstant: 30),
            
            /* this is like putting a top padding on top and bottom */
            button.topAnchor.constraint(equalTo: view3.topAnchor, constant: 15),
            button.bottomAnchor.constraint(equalTo: view3.bottomAnchor, constant: -15),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
        ])
    }

}

