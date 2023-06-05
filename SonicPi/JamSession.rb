# ***** Author: Piotr Goj ***
# *****    JamSession     ***
#
#
#

use_debug false
use_bpm 58
use_random_seed 12

live_loop :sync do     #sync loops
  sleep 1
end

define :intro do
  sync :sync
  sample :drum_cymbal_closed, amp: rrand(0.7, 1.2)
  sleep 0.5
  sample :drum_cymbal_closed, amp: rrand(0.7, 1.2)
  sleep 0.5
  sample :drum_cymbal_closed, amp: rrand(0.7, 1.2)
  sleep 0.5
  sample :drum_cymbal_closed, amp: rrand(0.7, 1.2)
end


#intro #comment this after start


live_loop :master, sync: :sync do
  set :tonation, (ring :Db, :C, :E, :G, :Gs,:B ,:F, :Ab, :A ).tick
  set :sc, :aeolian
  sleep 4 * 8
end

puts get[:tonation]

with_fx :compressor do
  with_fx :reverb do
    live_loop :drum, sync: :sync do
      use_random_seed rrand_i(0, 10000)
      intense = 0.8
      vol = 0.8
      
      24.times do
        
        if rand < 0.3 * intense # one_in 3
          sample :drum_heavy_kick, amp: rand * vol, rate: rrand(0.8, 1.2)
        end
        if rand < 0.2 * intense#one_in 6
          sample :drum_cymbal_hard, amp: (rand * 0.5) * vol, rate: rrand(0.99, 1.02) * 0.6
        end
        if rand < 0.2 * intense # one_in 5
          sample :drum_snare_hard, amp: rand * vol, rate: rrand(0.8, 1.2)
        end
        if rand < 0.9 * intense #one_in 9
          
          sample :drum_cymbal_closed, amp: 0.2 * vol, rate: rrand(0.97, 1.02), pan: rrand(-0.5, 0.5)
          
        end
        if tick(:drum)%8 == 0
          sample :drum_cowbell, amp: rand * 0.6 * vol, rate: rrand(0.95, 1.01)
        end
        
        sleep 0.25
      end
      #stop
      4.times do
        sample :drum_cymbal_closed, amp: 0.3 * vol , rate: rrand(0.98, 1.01), pan: rrand(-0.4, 0.4)
        
        sleep 0.5
      end
      
    end
  end
end


with_fx :compressor do
  live_loop :bass, sync: :sync do
    #stop
    vol = 1
    use_synth :fm
    if one_in 4
    else
      play (scale get[:tonation] - 24, :aeolian, num_octaves: 1).shuffle.tick, amp: rrand(1, 1.5) * vol, release: rrand(0.3, 2), sustain: 0, attack: 0.007
    end
    sleep 0.5
  end
end


with_fx :reverb, room: 1 do
  live_loop :piano, sync: :sync do
    #stop
    intense = 2
    use_synth :piano
    chordType = :maj
    sc = (scale get[:tonation] - 12, :aeolian, num_octaves: 1).choose
    
    if sc == 48 or sc == 53 or sc == 55 or sc == 60
      chordType = choose([:m7, :minor, '5', :m6, '1', :m11, :m13])
    else
      if sc == 51 or sc == 56 or sc == 58
        chordType = choose([:maj, :major, '1', '5', :maj11, :maj9])
      else
        chordType = choose([:dim7, '1', :dim])
      end
    end
    
    if rand < 0.3 * intense#one_in 3
      play sc - 12, amp: 0.3
      play chord_invert((chord sc, chordType), rrand_i(0,5)), release: rrand(0.3, 3), amp: rrand(0.3, 0.9) * 1.1
      
    end
    sleep 0.25
    
  end
end


with_fx :compressor do
  live_loop :solo, sync: :sync do
    stop
    intense = 1
    
    use_synth :dull_bell
    #use_synth :piano
    if rand < 0.3 * intense
      play (scale get[:tonation] - 12, :aeolian, num_octaves: 1).shuffle.tick, amp: rrand(1, 1.2) * 0.7, release: rrand(0.3, 1), sustain: rand
    end
    
    
    if rand < 0.1 * intense
      play (scale get[:tonation] - 12, :aeolian, num_octaves: 1).shuffle.tick, amp: rrand(1, 1.2) * 0.7, release: rrand(0.3, 1), sustain: rand
    end
    sleep 0.25
    
  end
end







