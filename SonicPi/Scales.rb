# ***** Author: Piotr Goj ***
# *****       Scales      ***
#
#
#

live_loop :metro do
  
  cue :step
  set :sc, :ferahnak
  set :key, :D
  puts get[:steps]
  sleep 1
end

live_loop :drum, sync: :metro do
  stop
  sync :step
  a = rand
  
  if a > 0.7
    sample :drum_cymbal_closed, amp: 1 , rate: rrand(0.96, 1.02)
    sleep 0.5
    sample :drum_cymbal_closed, amp: rand + 0.2, rate: rrand(0.96, 1.02)
  end
  if a < 0.1
    sample :drum_cymbal_closed, amp: 1, rate: rrand(0.96, 1.02)
    sleep 0.333
    sample :drum_cymbal_closed, amp: rand + 0.2, rate: rrand(0.96, 1.02)
    sleep 0.333
    sample :drum_cymbal_closed, amp: rand + 0.2, rate: rrand(0.96, 1.02)
    
  end
end

live_loop :kick do
  stop
  with_fx :reverb do
    16.times do
      sync :step
      sample :drum_bass_hard, amp: rand + 0.3, rate: rrand(0.96, 1.02)
      sleep 1
    end
  end
end

live_loop :snare, sync: :metro do
  stop
  sample :drum_snare_hard, amp: rand + 0.2, rate: rrand(0.96, 1.02)
  sleep choose([ 0.25, 0.5, 1])
end

live_loop :bass, sync: :metro do
  stop
  with_fx :echo do
    16.times do
      use_synth :fm
      play (scale get[:key], get[:sc]).choose - 24, release: rrand(0.1, 0.6), amp: 0.5
      sleep choose([ 0.25, 0.5, 1])
    end
  end
end

live_loop :melody do
  stop
  with_fx :slicer do
    16.times do
      use_synth :sine
      play (scale get[:key], get[:sc]).choose, amp: 0.3
      sleep choose([ 0.25, 0.5, 1])
    end
  end
end

live_loop :acc do
  stop
  with_fx :reverb do
    16.times do
      use_synth :dark_ambience
      play (chord (scale get[:key], get[:sc], num_octaves: 2).choose, "5"), amp: 0.4
      sleep choose([0.5, 1, 2, 0.25])
    end
  end
end

live_loop :solo, sync: :metro do
  stop
  with_fx :flanger do
    16.times do
      use_synth :piano
      play (scale get[:key], get[:sc]).choose - 12, amp: 0.5
      
      sleep choose([ 0.25, 1, 2, 0.5])
    end
  end
end
