## Piotr Goj

live_loop :master do
  set_link_bpm! 50
  set :sc, :minor_pentatonic
  set :ton, :D
  sleep 1
end

live_loop :mel, sync: :master do
  stop
  with_fx :reverb, room: 1 do
    with_fx :panslicer, pulse_width: 0.1 do
      use_synth :rodeo
      tick
      8.times do
        tick(:a)
        mel =  [0,   1,   [4, 5].choose, 3, 0].look(:a)
        time = [0.5, 0.5, 0.5, 0.5, 2].look(:a)
        play (scale get[:ton], get[:sc])[mel] ,release: [0.1, 0.1, 0.1, 0.1, 0.4].look, sustain: [0.1, 0.1, 0.1, 0.1, 0.2].look, amp: 0.5 if rand < 0.7
        
        sleep time
      end
      
      32.times do
        play (scale get[:ton], get[:sc]).choose, amp: 0.5 if rand < 0.8
        sleep 0.5
      end
      
      8.times do
        tick(:b)
        mel =  [6,   3,   [4, 5, 6].choose, 2, 0].look(:b)
        time = [0.5, 0.5, 0.5, 0.5, 2].look(:b)
        play (scale get[:ton], get[:sc])[mel] ,release: [0.1, 0.1, 0.1, 0.1, 0.4].look, sustain: [0.1, 0.1, 0.1, 0.1, 0.2].look, amp: 0.5 if rand < 0.7
        
        sleep time
      end
    end
  end
  sleep [16, 8, 4].choose
end

live_loop :bs, sync: :master do
  stop
  use_synth :zawa
  play get[:ton] - 24 , cutoff: 50, amp: rrand(0.5, 1)
  sleep 0.25
end

live_loop :dr, sync: :master do
  stop
  tick
  with_fx :reverb, room: 0.3 do
    with_fx :panslicer do
      8.times do
        use_synth :bass_foundation
        play get[:ton]
        use_synth :sc808_bassdrum
        sample :bass_thick_c, pitch: 2 if spread(3, 10).look
        sample :drum_bass_hard, amp: 5 if spread(1, 8).look and rand < 0.4
        sleep 0.5
      end
    end
  end
end