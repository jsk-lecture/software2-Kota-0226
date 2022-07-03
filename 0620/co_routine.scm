(define func0 (lambda ()
               (do ((i 0 (+ i 1)))
                   ((>= i 10) #f)
                 (print i)
                 (pause)
                 )))

(define func1 (lambda ()
               (do ((i 10 (+ i 1)))
                   ((>= i 20) #f)
                 (print i)
                 (pause)
                 )))

(use util.queue)
(define *queue* (make-queue))
(enqueue! *queue* func0)
(enqueue! *queue* func1)

(define (start)
  (if (not (queue-empty? *queue*))
      ((dequeue! *queue*))
      ;;(let ((f (dequeue! *queue*))) (f))
      ))
(define (pause)
  (call/cc (lambda (c)
             (enqueue! *queue* c)
             (start))))
(start)
