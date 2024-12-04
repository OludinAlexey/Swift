//
//  ViewController.swift
//  Functional programing
//
//  Created by Алексей Олудин on 04.12.2024.
//

//Домашняя работа по теме "Функциональное программирование".
//Задача
//
//Создайте enum с состояниями (которые могут быть у UIViewController, например, будетЗагружен, загружен и так далее) для абстрактной задачи
//
//Создайте структуру SimpleTask. У нее должны быть:
//1. Название
//2. Состояние (enum)
//
//Во ViewController необходимо создать объект SimpleTask и изменять ее состояния используя методы жизненного цикла VIewController.
//В каждом методе необходимо менять состояние задачи, а так же делать описание того, что происходит в данный момент.
//
//Необходимо использовать:
//LoadView, viewDidLoad, viewWillAppear, viewDidAppear, viewWillDisappear, viewDidDisappear

import UIKit


class ViewController: UIViewController {

    var task: SimpleTask = SimpleTask()
    
    override func loadView() {
        super.loadView()
        task.state = .loading
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        task.state = .loaded
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        task.state = .willAppear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        task.state = .didAppear
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        task.state = .willDisappear
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        task.state = .didDisappear
    }
}


