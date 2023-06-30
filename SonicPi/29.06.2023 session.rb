# Piotr Goj Live coding session 29.06.2023

live_loop :metro do
  stop
  set :key, :D
  set :scal, :messiaen1
  sleep 1
end


live_loop :mel, sync: :metro do
  stop
  use_synth :sine
  with_fx :reverb, room: 1, mix: 0.5 do
    16.times do
      with_fx :slicer do
        sc = scale get[:key], get[:scal], num_octaves: 1 #fackup:))
        play sc.choose - 12, sustain: 0.1, amp: 0.6, release: rrand(0.2, 4), pan: rrand(-1,1)
        sleep 2
      end
    end
  end
end

live_loop :kick, sync: :metro do
  stop
  sample :drum_bass_hard, amp: rrand(0.7, 0.9)
  sleep choose([1, 2])
end

live_loop :snare, sync: :metro do
  stop
  sample :drum_snare_hard,  amp: rrand(0.7, 0.9) * 0.5, pan: rrand(-0.1, 0.1)
  sleep choose([0.5, 1,  0.25])
end

live_loop :hihat, sync: :metro do
  stop
  sample :drum_cymbal_hard,  amp: rrand(0.4, 0.7) * 0.7, pan: rrand(-0.2, 0.2)
  sleep choose([0.25, 0.5, 1, 2])
end


live_loop :piano, sync: :metro do
  stop
  use_synth :piano
  with_fx :reverb do
    8.times do
      sc = scale get[:key], get[:scal], num_octaves: 1 #fackup:))
      play sc.choose, sustain: choose([0.5, 1, 2]), amp: 0.6
      sleep choose([0.5, 1, 2, 4])
    end
  end
end


live_loop :acc, sync: :metro do
  stop
  use_synth :kalimba
  with_fx :echo do
    8.times do
      sc = scale get[:key], get[:scal], num_octaves: 1 #fackup:))
      ch = (chord sc.choose - 12, :maj9)
      play ch, amp: 6, attack: 0.11 #hehe
      sleep choose([2, 1, 4])
    end
  end
end

live_loop :bass, sync: :metro do
  stop
  use_synth :fm
  sc = scale get[:key], get[:scal], num_octaves: 1 #fackup:))
  play sc.choose - 12, sustain: 0.1, amp: 0.1, release: rrand(0.2, 0.6)
  sleep choose([0.5, 1, 2])
end


live_loop :saw, sync: :metro do
  stop
  use_synth :saw
  with_fx :bitcrusher do
    sc = scale get[:key], get[:scal], num_octaves: 1 #fackup:))
    ch = (chord sc.choose - 12, "5")
    play ch, amp: 0.5, attack: 0.1, release: rrand( 0.2, 4) #hehe
    sleep choose([2, 1, 4, 8])
  end
end


#end



