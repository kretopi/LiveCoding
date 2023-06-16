# ***** Author: Piotr Goj ***
# *****     SynthWave    ***
#

live_loop :metro do #sync
  sleep 1
end

live_loop :drum, sync: :metro do
  stop
  sample :drum_bass_hard
  sleep 1
  sample :drum_snare_soft, amp: 0
  sleep 0.5
  sample :drum_cymbal_closed, amp: 0, pan: rrand(-0.3, 0.3) #0.5
  sleep 0.25
  if one_in 4
    sample :drum_cymbal_closed, amp: 0, pan: rrand(-1, 1)#0.4
  end
  sleep 0.25
end

live_loop :drum2, sync: :metro do
  #stop
  use_synth :mod_fm
  play choose([:D, :A, :E, :C, :G]), amp: 0 * rand, pan: rrand(-1, 1)
  with_fx :reverb do
    16.times do
      sample :drum_cymbal_hard, amp: 0, pan: rrand(-1,1)
      sleep 0.25
    end
  end
end

live_loop :boom, sync: :metro do
  # stop
    with_fx :reverb, room: 1 do
    use_synth choose([:sine, :dsaw])
    #:amp = 0.3
    play 64 + 12 * rrand_i(-1, 2), amp: 0, pan: rrand(-1, 1), sustain: 0.5, release: 5
    sleep 16
  end
end

live_loop :melody, sync: :metro do
  use_random_seed 3
  #stop
  with_fx :bitcrusher, mix: 0.1 do
    4.times do
      use_random_seed rrand(0, 100)
      4.times do
        use_synth :dsaw
        mel = (scale :D3, :minor_pentatonic, num_octave = 3).shuffle.ring.tick
        play mel, amp: 0 , pan: rrand(-0.5, 0.5) # amp: 0.4
        sleep choose([0.5, 0.25])
      end
    end
  end
end

live_loop :bass, sync: :metro do
  #stop
  with_fx :bitcrusher do
    with_fx :lpf, cutoff: rrand(30, 70) do
      4.times do
        use_synth :fm
        #amp 0.7
        mel = (scale :D2, :minor_pentatonic, num_octave = 3).shuffle.ring.tick
        play mel, amp: 0, release: 0.1, pan: rrand(-0.5, 0.5)
        sleep choose([0.5, 0.25])
      end
    end
  end
end
