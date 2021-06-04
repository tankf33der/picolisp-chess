(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")

(de testMate ()
   (unless (argv) (quit "usage"))
   (in (list 'xzcat (opt))
      (while (line T)
         (wait 1000)
         (println @) ) )
   (bye)
)
