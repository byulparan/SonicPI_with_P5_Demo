use_osc "127.0.0.1", 54110

live_loop :send_osc do
  use_synth :hollow
  play [:c3, :f3, :a3, :e4, :g4].choose + [0,12].choose, amp: 0.5, release: 4.0
  osc "/rgb_circle", rrand(0,255), rrand(0,255), rrand(0, 255)
  #osc "/pos_circle", 1000.0, 100.0
  sleep 0.25
end


