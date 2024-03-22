##| Live at Kino Kosmos Katowice
##| during Live Coding Music Workshop
##| 27.02 - 19.03 2024
##|
##| https://kosmos.katowice.pl
##| https://filmotekaslaska.com
##| https://kretopi.github.io
##|
##| ***** Author: Piotr Goj ***

live_loop :master, delay: 0.01 do
  set :bpm, 90
  use_bpm get[:bpm]
  set :ton, :D2
  set :sc, :major
  
  sleep 1
end

live_loop :drum, sync: :master do
  ##| stop
  use_bpm get[:bpm]
  tick
  with_fx :reverb do
    16.times do
      with_fx :compressor, amp: 0.5 do
        sample [:bd_gas, :bd_ada, :bd_pure, :bd_klub].choose, rate: rrand(0.7, 1.2), pan: rrand(-0.5, 0.5), cutoff: rrand(60, 80) if spread(9, 16).look
        sample [:drum_snare_soft, :drum_snare_hard].choose, rate: rrand(0.4, 1.2), pan: rrand(-0.5, 0.5), cutoff: rrand(80, 100) if spread(6, 16).look
        sample [:hat_snap, :hat_zan, :hat_zap, :hat_tap].choose, amp: 0.3, rate: rrand(0.4, 1.2), pan: rrand(-0.5, 0.5) if spread(12, 16).look
        
        sleep 0.25
      end
    end
  end
end

live_loop :bass, sync: :master do
  ##| stop
  use_bpm get[:bpm]
  use_synth :fm
  tick
  
  play(scale get[:ton], get[:sc]).choose if spread(10, 16).look
  
  sleep 0.25
end

live_loop :acc, sync: :master do
  ##| stop
  use_bpm get[:bpm]
  use_synth :chipbass
  tick
  
  with_fx :echo, mix: 0.4 do
    16.times do
      play chord(get[:ton] + 12, get[:sc], num_octaves: 2).choose
      
      sleep 0.25
    end
  end
end

live_loop :mel, sync: :master do
  ##| stop
  use_bpm get[:bpm]
  use_synth :beep
  tick
  
  play (scale get[:ton] + 24, get[:sc]).choose
  
  sleep 0.25
end

live_loop :eff, sync: :master do
  stop
  use_bpm get[:bpm]
  with_fx :ixi_techno, phase: 6 do
    sample [:ambi_soft_buzz, :ambi_swoosh, :ambi_drone, :ambi_glass_hum].choose, amp: rrand(1, 3), rate: rrand(-2, 2)
    
    sleep [2, 4, 8, 16].choose
  end
end