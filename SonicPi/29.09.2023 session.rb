use_bpm 80

live_loop :metro do
  sleep 0.25
end


live_loop :solo2, sync: :metro do
  stop
  use_synth :sine
  with_fx :reverb do
    a = scale :D, :minor, num_octaves: 4
    play a.choose , amp: rand * 0.02, cutoff: 100, pan: rrand(-1,1)
    
    sleep [0.125, 0.25, 0.5].choose
  end
end

live_loop :bass, sync: :metro do
  stop
  with_fx :ping_pong do
    use_synth :prophet
    a = scale :D, :aeolian
    play a.choose - 24 , cutoff: rrand(50,70), amp: rand * 0.1
    sleep [8, 16, 32].choose
  end
end

live_loop :eff, sync: :metro do
  stop
  with_fx :echo, decay: 4 do
    8.times do
      sample [:glitch_perc1, :glitch_perc2, :glitch_perc3, :glitch_robot2, :glitch_robot1].choose, rate: rrand(-2, 2), pan: rrand(-0.4, 0.4), amp: rand * 0.1, cutoff: 80
      sleep [1, 2, 4, 8, 16].choose
    end
  end
end

live_loop :guit, sync: :metro do
  stop
  with_fx :echo, decay: 4 do
    8.times do
      sample [:guit_em9, :guit_harmonics,:guit_e_fifths ,:guit_e_slide].choose, rate: rrand(0.4, 1), pan: rrand(-0.4, 0.4), amp: rand * 0.6, cutoff: 90
      sleep [1, 2, 4].choose
    end
  end
end

live_loop :drum, sync: :metro do
  stop
  sample :drum_bass_hard, rate: rrand(0.6, 1.3), cutoff: rrand(40, 90), amp: 0.9
  sleep [ 1, 2, 4].choose
end

live_loop :drum2, sync: :metro do
  stop
  with_fx :ping_pong, pre_mix: 0.5 do
    sample :drum_snare_soft, rate: rrand(0.6, 1.3), amp: rand * 0.5
    sleep [0.125, 0.25, 0.5, 1 , 2].choose
  end
end

live_loop :drum3, sync: :metro do
  stop
  with_fx :ping_pong, pre_mix: 0.5 do
    sample :drum_cymbal_closed, rate: rrand(-0.6, 1.3), amp: rand * 0.4
    sleep [0.125, 0.25, 0.5, 1 , 2, 4].choose
  end
end



live_loop :bass2, sync: :metro do
  stop
  use_synth :fm
  b = scale :D, :minor_pentatonic
  play b.choose - 24, amp: 0.1 * rand, pan: rrand(-0.7, 0.7), depth: 1, release: 1, attack: 0.5
  sleep [0.5, 1, 2].choose
end

live_loop :samp, sync: :metro do
  stop
  sample :ambi_glass_hum, rate: rrand(-2, 2), amp: 1.5, cutoff: rrand(80, 100)
  sleep [1, 2, 4].choose
end