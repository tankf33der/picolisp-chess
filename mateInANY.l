(load "engine.l")                # Official former lib.l
(symbols '(chess simul pico))    # https://software-lab.de/chess/README
(load "fen.l")

(de  ()
   (msg 'call-mike)
   (println (argv))
   (bye)
)

