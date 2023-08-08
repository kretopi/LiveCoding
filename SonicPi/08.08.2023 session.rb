#***** Piotr Goj ***
#***** 08.08.2023 session *** 



use_bpm 100

live_loop :metro do
  set :ch, :A3
  set :sc, :kurdili_hicazkar_3
  sleep 1
end

live_loop :samp, sync: :metro do
  stop
  sample :glitch_robot1 , amp: 1, onset: choose, rate: 1 , pan: rrand(-1,1)
  sleep choose([0.5, 1, 2, 4, 8])
end

live_loop :drum, sync: :metro do
  stop
  sample :drum_bass_hard, cutoff: 100
  sleep 1
  sample :drum_snare_hard
  sleep 1
end

live_loop :mel, sync: :metro do
  stop
  use_synth :prophet
  play (scale get[:ch], get[:sc]).choose, amp: 1, cutoff: choose([80, 70, 90, 100]), pan: rrand(-1,1)
  sleep choose([0.5, 0.25, 1])
end

live_loop :mel2, sync: :metro do
  stop
  use_synth choose([:mod_fm, :mod_pulse])
  play (scale get[:ch] , get[:sc]).choose
  sleep choose([1, 2, 4, 8])
end

live_loop :mel3, sync: :metro do
  with_fx :slicer do
    stop
    use_synth :fm
    play (scale get[:ch], get[:sc]).choose - 12, amp: 1.3
    sleep choose([1, 2])
  end
end

live_loop :harm, sync: :metro do
  stop
  
  with_fx :reverb do
    16.times do
      use_synth :mod_fm
      play get[:ch] + 12*(choose([1, 2, 3, 4])), amp: 0.3, pan: rrand(-1 ,1)
      sleep 0.25
    end
  end
end