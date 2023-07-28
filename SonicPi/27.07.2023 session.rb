#This is my improvisation with some advance code preparation

#Piotr Goj



use_bpm 55

#use_synth :beep
#play :C4, sustain: 0.1, release: 24
#sleep 0.5


live_loop :metro do
  sleep 1
end

live_loop :one, sync: :metro do
  with_fx :reverb do
    with_fx :panslicer, pan_max: 0.5 do
      with_fx :echo, phase: 0.5 do
        stop
        use_random_seed 4525
        use_synth :tri
        16.times do
          a = (ring :C2, :D2, :E2, :F2, :G2, :A2, :C3, :D3, :E3, :F3).choose
          play a + [0, 12, 24].choose + 2, release: 0.1
          use_synth :sine
          play a , release: 0.1, amp: rand * 0.3, pan: rrand(-1, 1)
          sleep 0.125
        end
      end
    end
  end
  
end

live_loop :bla, sync: :metro do
  stop
  use_synth :pretty_bell
  with_fx :echo, phase: 0.4 do
    play (scale :C3, :minor_pentatonic, num_octaves = 2).choose + 2, amp: 1, sustain: 0.2, release: 0.2
    sleep [0.5, 1, 2, 4].choose
    
  end
end

live_loop :one2, sync: :metro do
  stop
  with_fx :echo, phase: 0.1 do
    use_random_seed 7564567
    use_synth :tri
    4.times do
      a = (ring :C2, :D2, :E2, :F2, :A2, :G2, :C3).choose + 2
      play a + [24, 12].choose, release: 0.1, pan: rrand(-1, 1)
      sleep 0.125
    end
  end
  sleep [16, 8, 4, 2].choose
  # stop
end


live_loop :kick, sync: :metro do
  stop
  with_fx :echo do
    sample [:drum_bass_hard, :drum_bass_soft].choose, rate: [-0.7, -0.5, 0.5, 1].choose
    sleep [2, 4, 8, 16].choose
  end
end

live_loop :samp, sync: :metro do
  stop
  with_fx :bitcrusher, bits: 8, sample_rate: 20000 do
    sample [:ambi_sauna, :ambi_piano, :ambi_lunar_land].choose, amp: 0.2, rate: [-0.5, -0.7, 0.7 , 0.5, 1].choose
    sleep [1, 2, 4, 8].choose
  end
end
