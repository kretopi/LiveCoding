# ***** Author: Piotr Goj ***
# *****      Ambient      ***
#


use_debug false
use_bpm 52

with_fx :reverb, room: 1, mix: 0.7 do
  b = 12
  live_loop :instr do
    #stop
    a = (scale :c - 12, :major, num_octaves: 3)
    b = b + rrand_i(-2, 2)
    puts b
    play a[b], amp: rand * 0.7
    sleep rrand(0.25, 8)
  end
end

live_loop :ambient do
 # stop
  samp1 = :ambi_drone
  sample samp1, pan: rrand(-1,1)
  sleep sample_duration(samp1)
  
end

live_loop :amb2 do
  #stop
  samp2 = :ambi_piano
  sample samp2, rpitch: rrand_i(-8, 8), pan: rrand(-1,1)
  sleep sample_duration(samp2)
  
end


live_loop :amb3 do
  #stop
  samp3 = :ambi_glass_hum
  sample samp3, rpitch: rrand_i(-12, 12), amp: rand * 0.5, pan: rrand(-1,1)
  sleep sample_duration(samp3)
  
end

with_fx :reverb, mix: 0.6 do
  live_loop :synt do
    #stop
    use_synth :sine
    
    a = play rrand(50, 80), release: 10, sustain: 0, amp_slide: 3, note_slide: 3, attack: 1, pan_slide: 3
    sleep rrand(0.5, 8)
    control a, amp: rand * 0.5, note: rrand(60, 70), pan: rrand(-1, 1)
    sleep rrand(0.5, 8)
    control a, amp: rand * 0.5, note: rrand(55, 70), pan: rrand(-1, 1)
    sleep rrand(0.5, 8)
    control a, amp: rand * 0.5, note: rrand(55, 70), pan: rrand(-1, 1)
    sleep rrand(0.5, 8)
  end
  
  live_loop :synt2 do
    #stop
    use_synth :sine
    
    a = play rrand(40, 60), release: 10, sustain: 0, amp_slide: 3, note_slide: 3, attack: 1, pan_slide: 3
    sleep rrand(0.5, 8)
    control a, amp: rand * 0.5, note: rrand(60, 70), pan: rrand(-1, 1)
    sleep rrand(0.5, 8)
    control a, amp: rand * 0.5, note: rrand(55, 70), pan: rrand(-1, 1)
    sleep rrand(0.5, 8)
    control a, amp: rand * 0.5, note: rrand(55, 70), pan: rrand(-1, 1)
    sleep rrand(0.5, 8)
  end
end

with_fx :reverb, mix: 1 do
  live_loop :eee do
    #stop
    use_synth :mod_beep
    play note: rrand(55, 68), amp: 0.2, pan: rrand(-1,1)
    sleep 0.5
  end
end

with_fx :reverb, mix: 0.5 do
  with_fx :lpf, cutoff: 100 do |l|
    live_loop :down do
      #stop
      use_synth :noise
      play 30, attack: 2, attack_level: 0.1, sustain_level: 0.1, sustain: 1, release: 1, decay_level: 0.1, amp: rand * 2, pan: rrand(-1, 1)
      sleep 1
      control l, cutoff: rrand(20, 50)
      sleep 1
    end
  end
end
