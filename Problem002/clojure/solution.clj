(defn get-fibonacci-numbers
  "Returns a vector of fibonacci numbers whose largest value does not exceed n"
  [n]
  (defn get-fib-list
    [running-list]
    (let [n-minus-one (nth running-list (- (count running-list) 1))
          n-minus-two (nth running-list (- (count running-list) 2))
          next-fib (+ n-minus-one n-minus-two)
          new-running-list (conj running-list next-fib)]
      (if (>= next-fib n)
        running-list
        (get-fib-list new-running-list))))
  (cond
    (== n 0) []
    (or (== n 1) (== n 2)) [1]
    :else (get-fib-list [1 2])))
              
(defn solution
  []
  (reduce + 
          (filter even? 
                  (get-fibonacci-numbers 4000000))))

(println (solution))
 

              
      

