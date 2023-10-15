# *****      Piotr Goj     ***
# ***** 11.10.2023 session ***


live_loop :r do
  stop
  use_synth [:dark_ambience, :sine, :piano].choose
  s = play 60, release: 5, amp: 0
  sleep 0.5
  control s, note: 65 + rrand_i(-4, 6)
  sleep 0.5
  sample :elec_mid_snare
  
  sleep 1
  control s, note: 67 + rrand_i(-4, 6)
  sleep 1
  control s, note: 72 + rrand_i(-4, 6)
  sleep 1
  sample :bd_808, amp: 0.6
end

live_loop :e do
  stop
  
  with_fx :flanger do
    with_fx :echo do
      8.times do
        stop
        sample [:bass_dnb_f, :bass_thick_c, :bass_voxy_c, :bass_woodsy_c].choose, rate: rrand( -0.5, 1), amp: 0.9 * rand, pan: rrand(-1, 1), cutoff: rrand(50, 90)
        sleep [1, 2, 0.5].choose
        use_synth :dull_bell
        play rrand_i(55, 65), amp: rand
      end
      with_fx :distortion, distort: 0.8 do
        8.times do
          sample [:guit_harmonics , :guit_e_fifths  , :guit_e_slide, :guit_em9,  :bass_voxy_hit_c].choose, rate: rrand( -1.5, 1), amp: 0.8 * rand, pan: rrand(-1, 1), cutoff: rrand(70, 100)
          sleep [1, 2, 0.5].choose
        end
      end
    end
    with_fx :reverb do
      8.times do
        sample [:bass_dnb_f, :bass_hard_c , :bass_voxy_hit_c].choose, rate: rrand( -0.5, 1), amp: 0.9 * rand, pan: rrand(-1, 1), cutoff: rrand(50, 90)
        sleep [1, 2, 0.5, 4].choose
      end
    end
  end
  
  
end