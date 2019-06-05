//
//  SolveBoundaryValue.swift
//  NM_BoundaryValueProblem
//
//  Created by Иван Романов on 05/06/2019.
//  Copyright © 2019 Иван Романов. All rights reserved.
//

import Foundation

class 🤯 {
    let n=50// {Число точек}
    let h: Double
    
    var α : [Double], β: [Double],
    t: [Double], u: [Double],
    A : [Double], B : [Double], C: [Double], F: [Double]
    
    var preciseSolution : [Double]
    
    init(a: Double,  //{Границы интервала}
        b: Double,
        k1: Double, k2: Double, a1: Double,
        l1: Double, l2: Double, b1: Double,
        p: (Double)-> Double,
        q: (Double)-> Double,
        f: (Double)-> Double,
        solution: (Double)-> Double) {
        
        //{Вычисление шага сетки}
        h=(b-a)/Double(n)
        
        α = [Double](repeating: 0.0, count: n+1)
        β = [Double](repeating: 0.0, count: n+1)
        t = [Double](repeating: 0.0, count: n+1)
        u = [Double](repeating: 0.0, count: n+1)
        A = [Double](repeating: 0.0, count: n+1)
        B = [Double](repeating: 0.0, count: n+1)
        C = [Double](repeating: 0.0, count: n+1)
        F = [Double](repeating: 0.0, count: n+1)
        preciseSolution = [Double](repeating: 0.0, count: n+1)
        
        //{Формирование векторов коэффициентов для 3-диагональной СЛАУ}
        for i in 0...n {
            t[i]=a+h * Double(i);
            A[i]=1-p(t[i])*h/2;
            B[i]=1+p(t[i])*h/2;
            C[i]=2-q(t[i])*h*h;
            F[i]=h*h * f(t[i]);
            
            preciseSolution[i] = solution(t[i])
        }
        
        //{Краевое условие при t=a}
        α[1] = k2/(k2-k1*h);
        β[1] = -(a1*h)/(k2-k1*h);
        
        //{Прямой ход метода прогонки}
        for i in 1...n-1 {
            α[i+1] = B[i] / (C[i]-α[i] * A[i]);
            β[i+1] = (A[i] * β[i] - F[i]) / (C[i]-α[i] * A[i]);
        }
        
        //{Решение на правой границе отрезка}
        u[n] = (l2 * β[n]+b1*h) / (l2+h*l1-l2*α[n]);
        
        //{Обратный ход метода прогонки}
        for i in stride(from: n-1, to: -1, by: -1)  {
            u[i] = α[i+1] * u[i+1] + β[i+1];
            
            //{Вывод таблицы и определение макс.погрешности}
            /*print("i =   t[i]    y[i] = ")
             for i in 0...n {
             print( i," ", t[i], " ", u[i])
             }*/
            
        }
        
        
    }
}

